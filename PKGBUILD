# Maintainer: aksr <aksr at t-com dot me>
pkgname=bino-git
pkgver=1.6.5.r2.gd6ab95c
pkgrel=1
epoch=
pkgdesc="Stereoscopic 3D video player with multi-display support."
arch=('i686' 'x86_64')
url="http://bino3d.org/"
license=('GPLv3')
groups=()
depends=('ffmpeg' 'freealut' 'freeglut' 'glew' 'libass' 'qt5-base')
makedepends=('git')
optdepends=('lirc: for infrared remote control')
checkdepends=()
provides=('bino')
conflicts=('bino')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+http://git.savannah.gnu.org/r/bino.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^bino.//'
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -i
  ./configure --prefix=/usr --with-qt-version=5
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

