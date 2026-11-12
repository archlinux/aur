
pkgname=innex
pkgver=0.7.4
pkgrel=1
pkgdesc="Extract Inno Setup installers"
url=https://github.com/russellbanks/inno
license=('MIT')
arch=('x86_64')
depends=(libgcc glibc)
makedepends=(rust)
source=("inno-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('780c58672808933e1f428074675dab0758b6243ec6c90b944568b004a9d7c6d808d4904af3000b89ed928762a449d7c2936e642fd84fdb3ed4c471c1f398580d')

prepare(){
  cd inno-$pkgver/core
  cargo remove flate2
  cargo add flate2 --no-default-features --features zlib-rs
}

build(){
  cd inno-$pkgver
  cargo build --release
}

package(){
  cd inno-$pkgver
  install -Dm755 target/release/innex -t "$pkgdir"/usr/bin
  install -Dm644 LICENSE-{APACHE,MIT}.md -t "$pkgdir"/usr/share/licenses/${pkgname}
}
