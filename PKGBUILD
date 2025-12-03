# Maintainer: Josh Holmer <jholmer.in@gmail.com

pkgname=xav-dynamic-tq-git
pkgver=r112.a27f172
pkgrel=1
pkgdesc='The Most Efficient Chunked or Target Quality AV1/AV2 Encoding Framework'
arch=('x86_64')
url='https://github.com/emrakyz/xav'
license=('MIT')
makedepends=('git' 'cargo' 'nasm')
depends=('ffmpeg' 'svt-av1' 'ffms2' 'mkvtoolnix-cli' 'libvship')
provides=('xav' 'xav-git')
conflicts=('xav' 'xav-git')
source=("git+https://github.com/emrakyz/xav.git")
sha256sums=('SKIP')

pkgver() {
  cd "xav"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "xav"
  RUSTFLAGS="$RUSTFLAGS -C link-args=-fPIC -lffms2 -lvship" cargo build --release --features vship
}

package() {
  cd "xav"
  install -Dm 755 target/release/xav -t "${pkgdir}/usr/bin"
}
