# Maintainer: Kitsu mail@kitsu.me
pkgname=yofi-git
pkgver=0.1.3.r30.g39c828d
pkgrel=1
pkgdesc="Minimalistic menu for Wayland-based compositors"
arch=('i686' 'x86_64')
url="https://github.com/l4l/yofi"
license=('MIT')
depends=('fontconfig' 'expat' 'graphite' 'pcre' 'wayland-protocols' 'libxkbcommon')
makedepends=('cargo' 'git')
provides=('yofi')
source=("$pkgname::git+https://github.com/l4l/yofi.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/yofi" "$pkgdir/usr/bin/yofi"
}

