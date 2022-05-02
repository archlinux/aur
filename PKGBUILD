# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=evolvere-icons-git
pkgver=2.5.0.beta.r904.gdba69090
pkgrel=1
pkgdesc='Evolvere icons 2, flat with touches of realism'
arch=('any')
url="https://github.com/franksouza183/Evolvere-Icons"
license=('custom:CC-BY-4.0')
depends=('hicolor-icon-theme')
optdepends=('breeze-icons: to inherit breeze icons for KDE/Qt applications'
            'gnome-icon-theme: to inherit gnome icons for gtk applications')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=(!strip)
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}/Icons"
  ver="$(grep 'Version=' index.theme | awk -F '=' '{print $2}')"
  printf '%s.r%s.g%s' "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

  mkdir -p ${pkgdir}/usr/share/icons/
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname%-*}/
  cp -r $srcdir/${pkgname%-*}/Icons ${pkgdir}/usr/share/icons/${pkgname%-*}
  cp -r $srcdir/${pkgname%-*}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE

}
