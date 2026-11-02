
pkgname=innex
pkgver=0.7.3
pkgrel=1
pkgdesc="Extract Inno Setup installers"
url=https://github.com/russellbanks/inno
license=('MIT')
arch=('x86_64')
depends=(libgcc glibc)
makedepends=(rust)
source=("inno-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('3578f2e8feb05be5e3c7a2a0e0655449ed4b208daff5cdc4912038a7da426b5dfb57f977f948d5cc695435c06c2107b934686a3dbcdbe8ccf87aec8c3dd85f14')

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
