# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=walles
_pkgname=riff
pkgname=${_pkgname}-bin
pkgver=3.3.4
pkgrel=2
pkgdesc='A diff filter highlighting which line parts have changed'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64')
license=('MIT')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux"
        "LICENSE_${pkgver}::${_urlraw}/LICENSE"
        "README_${pkgver}::${_urlraw}/README.md")
sha256sums=('4f312b96554196e91fdd628d9b4aefb8791b80b9e0c627a1991a3e2fac0e498a'
            '8fe11bd57802035aa8be7cb7382edd1e5f7e53cc6d2ca078271b59b1f94bde26'
            'c06f03e7de583b8191549d3e70171afe2804d06d3e22f0139c530478eed5bc4b')


build() {
  cd "${srcdir}/" || exit

  mv ${_pkgname}-${pkgver}-x86_64-linux ${_pkgname}
  chmod +x ${_pkgname}

  help2man ${_pkgname} --output "MAN-${pkgver}.1"
}

package() {
  cd "$srcdir/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
