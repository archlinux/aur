# Maintainer: Jan Murawski <jm at rq-project dot net>

pkgname='rust-dependency-refresh'
pkgver="0.3.0"
pkgrel=1
pkgdesc='rust dependency updater'
url='https://github.com/RoffelKartoffel/dependency-refresh'
license=(
 'LGPL3'
)
source=(
 "https://github.com/RoffelKartoffel/dependency-refresh/archive/${pkgver}.tar.gz"
)
sha512sums=('b2f45ee22f5c894483c127e47835859cc011593feda043ad36a52a8072d363f493c46f238a8eca3bd4fef6b2ce3f1b9a4b5a8ed78ca55ae520e746d9e5363dee')
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
