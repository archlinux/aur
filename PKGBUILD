
pkgname=innex
pkgver=0.7.6
pkgrel=1
pkgdesc="Extract Inno Setup installers"
url=https://github.com/russellbanks/inno
license=('MIT')
arch=('x86_64')
depends=(libgcc glibc)
makedepends=(rust)
source=("inno-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('1ce5d7b4bc526332bfdbf2e06074151db23df751a5843d45478e6997963766623ffa1558aed6102823e2e241cbbd0e88254f10d4565317a0db1d75badb542dd2')

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
