# Maintainer : MorsMortium <morsmortium@gmail.com>

_pkgname=lbry-gtk
pkgname=${_pkgname}-git
pkgver=199.dc7585c
pkgrel=3
pkgdesc='Native desktop LBRY client'
arch=('any')
url="https://codeberg.org/MorsMortium/${_pkgname}"
license=('GPL-3.0')
depends=('python' 'python-appdirs' 'python-gobject' 'python-cairo' 'python-requests' 'python-pillow' 'python-markdown' 'gtk3' 'lbrynet' 'python-setproctitle')
provides=("${_pkgname}")
makedepends=('git')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 ./share/icons/hicolor/scalable/apps/${_pkgname}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg
  install -Dm 755 ./bin/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm 755 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  cp -a ./share/${_pkgname} ${pkgdir}/usr/share/${_pkgname}
}
