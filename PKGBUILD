# Maintainer: Jan Murawski <jm at rq-project dot net>

pkgname='rust-dependency-refresh'
pkgver="0.1.12"
pkgrel=1
pkgdesc='rust dependency updater'
url='https://github.com/RoffelKartoffel/dependency-refresh'
license=(
 'LGPL3'
)
source=(
 "https://github.com/RoffelKartoffel/dependency-refresh/archive/${pkgver}.tar.gz"
)
sha512sums=('ef72715185ce1f85588fb9b8793a6e4c9c71c8b3674e3c68f66f4a6d9fd6bb6330126494e9d7fad4e366e9afc1a000d25d91252ab36acd3d85f7edb35c4c3af9')
arch=(
 'x86_64'
 'i686'
)
depends=(
 'openssl'
)
makedepends=(
 'rust'
)

build() {
 pushd "dependency-refresh-${pkgver}"
 cargo build --release
 cd target/release
 ln -s dr dependency-refresh
 popd
}

package() {
 mkdir -p $pkgdir/usr/bin/
 install "${srcdir}/dependency-refresh-${pkgver}/target/release/dr" "$pkgdir/usr/bin/"
 install "${srcdir}/dependency-refresh-${pkgver}/target/release/dependency-refresh" "$pkgdir/usr/bin/"
}
