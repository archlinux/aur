# Maintainer: Christopher Torres <christopher dot torres at azgstudio dot com>

pkgname=vpc-shift-tool-git
pkgver=1.0.r1.g7c57d73
pkgrel=2
pkgdesc="Tool for replicating VIRPIL joystick states from one device to another."
arch=('i686' 'x86_64')
url="https://github.com/RavenX8/vpc-shift-tool.git"
license=('GPL3')
depends=('libusb')
makedepends=('git' 'cargo')
provides=("vpc-shift-tool")
conflicts=("vpc-shift-tool")
source=("git+$url" "vpc-shift-tool.desktop")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/vpc-shift-tool"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/vpc-shift-tool"
}

build() {
  cd "$srcdir/vpc-shift-tool"
  make
}

package() {
  cd "$srcdir/vpc-shift-tool"
  make DESTDIR="$pkgdir" install

  # Install desktop file
  install -Dm644 "$srcdir/vpc-shift-tool.desktop" "$pkgdir/usr/share/applications/vpc-shift-tool.desktop"
}
