# Maintainer: Jan Murawski <jm at rq-project dot net>

pkgname='rust-dependency-refresh'
pkgver="0.1.6"
pkgrel=1
pkgdesc='rust dependency updater'
url='https://github.com/RoffelKartoffel/dependency-refresh'
license=(
 'LGPL3'
)
source=(
 "https://github.com/RoffelKartoffel/dependency-refresh/archive/${pkgver}.tar.gz"
)
sha512sums=('a7e9ed8f4efc06b06bc8ad943c68b297d6a92da369194552d57b4f9dbb6ae8110ae0efd149b3c238425f50713d605695daf526a0841bbe7f4e5f5281b08672f4')
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
