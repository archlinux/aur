
pkgname=innex
pkgver=0.7.2
pkgrel=1
pkgdesc="Extract Inno Setup installers"
url=https://github.com/russellbanks/inno
license=('MIT')
arch=('x86_64')
depends=(libgcc glibc)
makedepends=(rust)
source=("inno-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0bbf6a96d9641d511bae6e57d6fb289955e8417a33584517c38bb5f0a922da524ba6bba7aa1bb2ac92b1df1072404f86c7c35b396a70a4a84e15ffcdc20d5d29')

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
