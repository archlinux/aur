# Maintainer: Christian Rebischke <Chris.Rebischke[at]archlinux[dot]org>
_pkgname=awesome-terminal-fonts
pkgname="${_pkgname}"-git
pkgver=60.b5fdcfd
pkgrel=1
pkgdesc="fonts/icons for powerlines"
arch=('any')
url="https://github.com/gabrielelana/awesome-terminal-fonts"
license=('MIT')
depends=('fontconfig')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("git+https://github.com/gabrielelana/awesome-terminal-fonts")
sha512sums=('SKIP') 

pkgver() {
  cd "${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/fonts/${_pkgname}"
  install -d "${pkgdir}/etc/fonts/conf.avail"
  install -d -m 0644 "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m 0644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
  install -m 0644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  cd "${srcdir}/${_pkgname}/build"
  install -p -m 0644 * "${pkgdir}/usr/share/fonts/${_pkgname}/"
  install -p -m 0644 "${srcdir}/${_pkgname}/config/10-symbols.conf" "${pkgdir}/etc/fonts/conf.avail"
}

# vim:set et sw=2 ts=2 tw=79:
