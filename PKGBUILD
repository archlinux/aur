# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
# Contributor: Kyle Guarco <kyleguarco55@gmail.com
pkgname="berry"
pkgver=0.1.13
pkgrel=1
pkgdesc="A healthy, bite-sized window manager written over the XLib Library"
url="https://github.com/JLErvin/berry"
arch=('x86_64')
license=('MIT')
makedepends=('gcc' 'make')
depends=('libx11' 'libxft' 'libxinerama')
source=("$pkgname-$pkgver.tar.gz"::"$url/archive/$pkgver.tar.gz")
source+=("berry.desktop")

sha256sums=('839c0bdafbecbcb999e519a6fc32edbd37d9f010a205ccc34d71aa25ece1a768'
            'e1801d7429f8b0c213cb2026ab56ad3e313dcde033a3db176a94b0ef3daa75a6')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  # These variables are used in the Makefile to create the file directories.
  PREFIX="/usr/local/"
  EXAMPLEPREFIX="/etc/xdg/berry/"

  # Set the variables and install the files.  
  ./configure --prefix=/usr

  # Compile the window manager
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # Install the examples (sample configuration files)
  install -vDm0644 -t "$pkgdir/etc/xdg/berry" \
    examples/*

  # Install LICENSE
  install -vDm0644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  # Install berry.desktop
  install -vDm0644 "$srcdir/berry.desktop" -t "$pkgdir/usr/share/applications"
}
