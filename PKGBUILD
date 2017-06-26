# Maintainer: defkeh <defkeh@gmail.com>
pkgname=rivalcfg-git
pkgver=r94.4fef996
pkgrel=1
pkgdesc="SteelSeries Rival gaming mouse configuration utility"
arch=("any")
url="https://github.com/flozz/rivalcfg"
license=("custom:WTFPL")
depends=("python" "python-pyudev")
makedepends=('git')
conflicts=("rivalctl")
provides=("${pkgname%-git}")
source=("${pkgname%-git}"::'git+https://github.com/flozz/rivalcfg#branch=master')
install=${pkgname}.install
md5sums=('SKIP') 


pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 doc/rival-spec.md "${pkgdir}/usr/share/doc/${pkgname}/rival-spec.md" 
  install -D -m644 doc/rival100-spec.md "${pkgdir}/usr/share/doc/${pkgname}/rival-spec100.md" 
  install -D -m644 doc/rival300-spec.md "${pkgdir}/usr/share/doc/${pkgname}/rival-spec300.md" 
  install -D -m644 "${pkgname%-git}/data/99-steelseries-rival.rules" "${pkgdir}/etc/udev/rules.d/99-steelseries-rival.rules"
}

# vim:set ts=2 sw=2 et:
