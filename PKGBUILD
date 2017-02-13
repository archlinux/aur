# Maintainer: Det <nimetonmaili g-mail>
# Contributor: <Eugeny Borisov flekst@gmail.com>
# Based on [extra]'s xf86-input-evdev: https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/xf86-input-evdev

_pkgname=libxfont2
pkgname=$_pkgname-git
pkgver=gf8ff8d5.r326.
pkgrel=1
pkgdesc="X.org xfont2 - Git version"
arch=('x86_64')
url="https://cgit.freedesktop.org/xorg/lib/libXfont"
license=('custom')
groups=('xorg')
depends=('glibc' 'systemd-tools' 'mtdev')
makedepends=('xorg-server-devel' 'resourceproto' 'scrnsaverproto' 'git' 'xtrans')
provides=("$_pkgname=$pkgver" 'libxfont2')
conflicts=('xorg-server<1.18.0' "$_pkgname")
options=('!libtool' '!makeflags')
source=("git://anongit.freedesktop.org/xorg/lib/libXfont")
md5sums=('SKIP')

pkgver() {
  cd libXfont

  echo $(git describe --long | cut -d "-" -f4-5 | tr - .).r$(git rev-list HEAD --count).$(git describe --long | cut -d "-" -f6)
}

build() {
  cd libXfont

  msg2 "Starting autogen.sh..."
  ./autogen.sh --prefix=/usr

  msg2 "Starting make..."
  make
}

package() {
  cd libXfont

  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
