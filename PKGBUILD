# MAINTAINER: ramen <hendrikjschick@gmail.com>
# CONTRIBUTOR: aksr <aksr at t-com dot me>
pkgname=bino-git
pkgver=1.6.8
pkgrel=2
pkgdesc="Stereoscopic 3D video player with multi-display support."
arch=('i686' 'x86_64')
url="http://bino3d.org/"
license=('GPLv3')
depends=('ffmpeg4.4' 'freealut' 'freeglut' 'glew' 'libass' 'qt5-base')
makedepends=('git')
optdepends=('lirc: for infrared remote control')
provides=('bino')
conflicts=('bino')
source=("$pkgname::git+https://git.marlam.de/git/bino.git" ffmpeg4.4.patch)
noextract=()
md5sums=('SKIP' 'SKIP')


pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^bino.//'
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -i
  patch -Np1 -i ${srcdir}/ffmpeg4.4.patch
  ./configure --prefix=/usr --with-qt-version=5
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

