# Maintainer: Alexis Jeandeau <alexis[dot]jeandeau[at]gmail[dot]com>

pkgname=tcpsplit
pkgver=0.2
pkgrel=1
pkgdesc="Breaks a single libpcap packet trace into some number of sub-traces."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://www.icir.org/mallman/software/tcpsplit/"
license=('custom')
depends=('libpcap')
source=("http://www.icir.org/mallman/software/tcpsplit/${pkgname}-${pkgver}.tar.gz")
sha256sums=('885a6609d04eb35f31f1c6f06a0b9afd88776d85dec0caa33a86cef3f3c09d1d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # _BSD_SOURCE is deprecated, use _DEFAULT_SOURCE
  sed -i 's/BSD_SOURCE/DEFAULT_SOURCE/' Makefile.linux
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make -f Makefile.linux
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "validate" "${pkgdir}/usr/bin/${pkgname}-validate"

  install -Dm644 "COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
