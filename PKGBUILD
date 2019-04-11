# Maintainer: Jan Murawski <jm at rq-project dot net>

pkgname='rust-dependency-refresh'
pkgver="0.1.2"
pkgrel=1
pkgdesc='rust dependency updater'
url='https://github.com/RoffelKartoffel/dependency-refresh'
license=(
 'LGPL3'
)
source=(
 "https://github.com/RoffelKartoffel/dependency-refresh/archive/${pkgver}.tar.gz"
)
sha512sums=('692669263bb1b407ab66077523347368ebdc119b8c7a5815561c6bfd091cc5d3cb9e497f0173a030eae178b6d83af9e5d615591fba1dc6ab55d9902ae8ba20a8')
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
