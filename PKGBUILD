# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rep-gtk-git
pkgver=0.90.8.3.11.g99c9072
pkgrel=1
pkgdesc="Binding of the GTK and GDK libraries for the librep Lisp environment - git version"
arch=('i686' 'x86_64')
url="http://rep-gtk.sourceforge.net/"
license=('GPL')
depends=('librep' 'gtk2')
conflicts=('rep-gtk')
provides=("rep-gtk=$pkgver")
options=('!libtool')
options=('libtool')
source=(git+https://github.com/SawfishWM/rep-gtk.git)
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  echo $(git describe --tags |sed 's/-/./g'|cut -c9-)
}

build() {
  cd ${pkgname%-git}

  ./autogen.sh 
  ./configure --prefix=/usr 
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
