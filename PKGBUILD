# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Scarlett Veldt <scarlett AT enby DOT site>
pkgname=arrpc
pkgver=3.4.0
pkgrel=3
pkgdesc="Open Discord RPC server for atypical setups"
arch=('x86_64' 'x86_64_v3')
url="https://arrpc.openasar.dev/"
license=('MIT')
depends=("glibc" "gcc-libs")
makedepends=("npm")
# for some reason stripping the binary breaks it
options=(!strip)
install=arrpc.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenAsar/arrpc/archive/refs/tags/${pkgver}.tar.gz"
        "arrpc.service")
sha256sums=('8f1f2054e70221922f30920c3ef11cfdded1ddf7425f73c808c033bdc18a0911'
            'dccc409ef768766d8d4141f8d89366e0bbecd30d9b08d4d31856b01f180c4005')

package() {
  npm install --cache "${srcdir}/npm-cache" \
    -g --prefix "${pkgdir}/usr" \
    "${srcdir}/${pkgname}-${pkgver}.tar.gz"

  install -D -m644 "${pkgname}-${pkgver}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 arrpc.service "${pkgdir}/usr/lib/systemd/user/arrpc.service"
}
