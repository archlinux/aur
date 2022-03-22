# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=xfway
pkgver=4.13.0
pkgrel=2
githash="ff907226b20654974c64ec5d243804acbc47dccb"
pkgdesc="xfway is a weston clone that xfce can(should) run on top of."
arch=('x86_64' 'i686')
url="https://github.com/bokic/xfway"
license=('GPL')
depends=('weston' 'wayland' 'gtk3' 'xfconf' 'cairo' 'pango' 'pixman' 'glib2' 'glibc')
makedepends=('xfce4-dev-tools' 'weston' 'wayland' 'gtk3' 'xfconf' 'cairo' 'pango' 'pixman' 'glib2' 'glibc')
conflicts=()
replaces=()
backup=()
options=()

source=("https://github.com/bokic/xfway/archive/$githash.tar.gz")
sha256sums=("f2f446b94aedc8b74614791a851f1135178b957ed2f9e06d22d816720528234e")

build() {
  cd "${srcdir}/${pkgname}-${githash}"
  ./autogen.sh
  make protocol/xdg-shell.c
  make protocol/xdg-shell.h
  make
}

package() {
  cd "${srcdir}/${pkgname}-${githash}"
  install -Dm755 src/xfway "$pkgdir/usr/local/bin/xfway"
  install -Dm755 src/xfway-shell "$pkgdir/usr/local/bin/xfway-shell"
}
