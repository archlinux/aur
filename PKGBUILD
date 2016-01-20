# Maintainer: Dylan <dylan@psilly.com>

pkg_base=playform
pkgname=('playform-server')
pkgver=0.0.0
pkgrel=1
arch=('i686' 'x86_64')
url='http://playformdev.blogspot.ca/'
makedepends=('cargo' 'libgl' 'libpng' 'sdl2' 'sdl2_ttf' 'nanomsg')
license=('MIT')
_git_branch=master
source=(
    https://github.com/bfops/$pkg_base/archive/$_git_branch.tar.gz
)
sha256sums=(
    SKIP
)

build() {
  cd $srcdir/$pkg_base-$_git_branch/server/bin
  cargo build --release
}

package_playform-server() {
  pkgdesc='Playform is an open-world sandbox game written in Rust - server'
  depends=('libgl' 'libpng' 'sdl2' 'sdl2_ttf' 'nanomsg')
  cd $srcdir/$pkg_base-$_git_branch
  install -Dm755 server/bin/target/release/server $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE '$pkgdir/usr/share/licenses/$pkgname/LICENSE'
}

