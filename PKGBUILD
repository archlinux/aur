# Maintainer:  Konstantin Gorodinskii <mail@konstantin.io>
pkgname='wabt'
pkgdesc="The WebAssembly Binary Toolkit is a suite of tools for WebAssembly"
provides=('wabt')
url="https://github.com/WebAssembly/wabt"
pkgver=1.0
pkgrel=0
arch=('x86_64')
license=('APACHE')
depends=()
makedepends=('cmake' 'git' 'gcc' 'clang')
source=("git+https://github.com/WebAssembly/wabt")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  git rev-list --count HEAD
}

build() {
  cd "$srcdir/$pkgname"
  git submodule update --init
  make
}

package() {
  cd "$srcdir/$pkgname/bin"

  install -Dm755 -t "$pkgdir/usr/bin" ./*
}
