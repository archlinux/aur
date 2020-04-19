# Maintainer: Nathan Parsons <nathan at nparsons dot uk>

pkgname=j4-persist
pkgver=0.1.3
pkgrel=1
pkgdesc="i3wm's kill, but with persistent containers"
url="https://github.com/n-parsons/j4-persist"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(MIT)
makedepends=(cargo git)
_commit=62c4f65f0b301604d37a9c7211b2e39efcc437bc  # tags/v0.1.3
source=("git+https://github.com/n-parsons/j4-persist#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $pkgname
  cargo fetch --locked
}

build() {
  cd $pkgname
  cargo build --release --frozen --all-features
}

package() {
  cd $pkgname
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
