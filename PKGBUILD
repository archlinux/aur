# Maintainer: Jonathan Mast <jon@jonmast.com>
# Based on nushell package, but uses prebuilt binary

pkgname=nushell-bin
pkgver=0.8.0
_underscoredpkgver=0_8_0
pkgrel=1
depends=('zlib')
optdepends=('libxcb' 'libx11')
arch=('i686' 'x86_64')
pkgdesc="A shell for the GitHub era"
conflicts=('nushell')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nushell/nushell/releases/download/$pkgver/nu_${_underscoredpkgver}_linux.tar.gz"
        'nu-wrapper')
url="http://nushell.sh"
license=('MIT')
sha256sums=('37889223376450f12f44f72001051056578e2ca54c8b8393a37bc1e150af3ce6'
            '7833deeeb802bd9f6a11c7509cf930efc3c7e8ef314b56b9df022b90ca42c5f6')

build() {
  return 0
}

package() {
  install -dm755 "${pkgdir}/usr/bin/"
  cp "${srcdir}/nu-wrapper" "${pkgdir}/usr/bin/nu"

  cd "$srcdir/nu_${_underscoredpkgver}_linux/nushell_${_underscoredpkgver}"

  install -dm755 "${pkgdir}/usr/lib/nushell"

  # Install all binaries and libs into lib directory
  cp nu "${pkgdir}/usr/lib/nushell/"
  cp lib* "${pkgdir}/usr/lib/nushell/"
  cp nu_plugin_* "${pkgdir}/usr/lib/nushell/"
}
