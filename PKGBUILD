# Contributor:  Vincent Grande <shoober420@gmail.com>
# Contributor: quininer

_name=vtebench
pkgname=vtebench-git
pkgver=0.3.1.r15.gc75155b
pkgrel=1
arch=('x86_64')
url=https://github.com/alacritty/vtebench
pkgdesc="Generate benchmarks for terminal emulators"
license=('Apache')
depends=('freetype2' 'fontconfig' 'libxi' 'libxcursor' 'libxrandr')
makedepends=('rust' 'cargo' 'cmake' 'fontconfig' 'ncurses' 'desktop-file-utils' 'gdb' 'libxcb' 'git')
install=vtebench.install
provides=(vtebench)
conflicts=(vtebench)
source=(git+https://github.com/alacritty/vtebench)
sha256sums=('SKIP')

pkgver() {
  cd ${_name}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build(){
  cd ${_name}
  env CARGO_INCREMENTAL=0 cargo build --release --locked
}

#check(){
#  cd vtebench
#  env CARGO_INCREMENTAL=0 cargo test --release
#}

package() {
  cd ${_name}
  install -D -m755 "target/release/vtebench" "$pkgdir/usr/bin/vtebench"
  install -d "${pkgdir}/usr/share/vtebench/benchmarks"
  cp -r "$srcdir/vtebench/benchmarks" "${pkgdir}/usr/share/vtebench"
}
