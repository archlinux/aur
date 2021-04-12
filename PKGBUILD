# Maintainer: Jan Murawski <jm at rq-project dot net>

pkgname='rust-dependency-refresh'
pkgver="0.2.0"
pkgrel=1
pkgdesc='rust dependency updater'
url='https://github.com/RoffelKartoffel/dependency-refresh'
license=(
 'LGPL3'
)
source=(
 "https://github.com/RoffelKartoffel/dependency-refresh/archive/${pkgver}.tar.gz"
)
sha512sums=('892fb64f31b3a7d787548aaaf893ee35989c9d9c22480bf6d1146aa1102ad1b6e39984f636187b457bccf0001e6f8a6c3d97f7230db8ce8b5ea31732e651f692')
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
