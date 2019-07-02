# Maintainer: Amr Hassan <amr.hassan@gmail.com>
pkgname=pyoxidizer
name=PyOxidizer
pkgver=0.2.0
pkgrel=1
pkgdesc="A modern Python application packaging and distribution tool"
arch=(x86_64)
url="https://github.com/indygreg/PyOxidizer"
license=('MIT')
source=("https://github.com/indygreg/$name/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('04dfe490dba4ae9c2d42b4044413645e')
makedepends=(rustup)

prepare() {
   rustup default stable
}

build() {
   cd "$name-$pkgver"
   cargo build --bin pyoxidizer --release --locked
}

check() {
   cd "$name-$pkgver"
   cargo test --bin pyoxidizer --release --locked
}

package() {
   cd "$name-$pkgver"
   install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
