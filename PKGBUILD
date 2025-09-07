# Contributor: nfnty

pkgname=tini
pkgdesc='A tiny but valid `init` for containers'
pkgver=0.19.0
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/krallin/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
source=("git+${url}.git#tag=v${pkgver}")
sha512sums=('326fd3c64a1f80abb4a3824b0c1bf0e8ea29fed0afe4d4159508bd39f2159282675b7c0eda4a3c3ec49833295418f1bd436afc9a18dcd37ba31fe5aeb98c1635')

build() {
    cd "${pkgname}"
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_INSTALL_PREFIX='/usr' .
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" install
    rm "${pkgdir}/usr/bin/tini-static"
}
