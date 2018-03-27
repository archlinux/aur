# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=evolvere-icons-git
pkgver=2.4.r250.g3568bc9
pkgrel=1
pkgdesc='Evolvere icons 2, flat with touches of realism'
arch=('any')
url="https://github.com/franksouza183/Evolvere-Icons"
license=('custom:CC-BY-4.0')
optdepends=('breeze-icons: to inherit breeze icons for KDE/Qt applications'
            'gnome-icon-theme: to inherit gnome icons for gtk applications')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=(!strip)
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  ver="$(grep 'Version=' index.theme | awk -F '=' '{print $2}')"
  printf '%s.r%s.g%s' "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d ${pkgdir}/usr/share/icons/
  install -Dm644 ${pkgname%-*}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -rf ${pkgname%-*}/{LICENSE,*.md,*.png,adjust-*,.git}
  cp -r ${pkgname%-*} ${pkgdir}/usr/share/icons/${pkgname%-*}-2
}
