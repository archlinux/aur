
pkgname=innex
pkgver=0.7.5
pkgrel=1
pkgdesc="Extract Inno Setup installers"
url=https://github.com/russellbanks/inno
license=('MIT')
arch=('x86_64')
depends=(libgcc glibc)
makedepends=(rust)
source=("inno-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('6d27e176390b82def79a6da0a7d0d5de82527f5fad1a3d6e1e710f5247cc6c7b8ffb5577e7926bd145b95caef65f16248705bb820827d7f1f519c06c59f8aba9')

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
