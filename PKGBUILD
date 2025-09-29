# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Scarlett Veldt <scarlett AT enby DOT site>
pkgname=arrpc
pkgver=3.6.0
pkgrel=1
pkgdesc="Open Discord RPC server for atypical setups"
arch=('any')
url="https://arrpc.openasar.dev/"
license=('MIT')
depends=('nodejs')
makedepends=("npm")
# for some reason stripping the binary breaks it
options=(!strip)
install=arrpc.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenAsar/arrpc/archive/refs/tags/${pkgver}.tar.gz"
        "arrpc.service")
sha256sums=('153aed144efa4477345e48a8728505e936fd8a77f69dde7d0354258232638c05'
            'dccc409ef768766d8d4141f8d89366e0bbecd30d9b08d4d31856b01f180c4005')

package() {
  npm install --cache "${srcdir}/npm-cache" \
    -g --prefix "${pkgdir}/usr" \
    "${srcdir}/${pkgname}-${pkgver}.tar.gz"

  install -D -m644 "${pkgname}-${pkgver}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 arrpc.service "${pkgdir}/usr/lib/systemd/user/arrpc.service"
}
