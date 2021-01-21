# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=mcmojave-cursors-git
pkgver=r9.d3a9b60
pkgrel=1
pkgdesc='x-cursor theme inspired by macOS and based on capitaine-cursors'
url='https://github.com/vinceliuice/McMojave-cursors'
license=('GPL')
arch=('any')
source=("${pkgname}::git+https://github.com/vinceliuice/McMojave-cursors.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${pkgname}"

  install -dm0755 "${pkgdir}/usr/share/icons/${pkgname%-git}"
  cp -r dist/* "${pkgdir}/usr/share/icons/${pkgname%-git}"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
