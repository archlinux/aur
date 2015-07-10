# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=gtk-engine-equinox
pkgver=1.50
pkgrel=2
pkgdesc="A heavily modified version of the beautiful Aurora engine"
url="http://gnome-look.org/content/show.php/Equinox+GTK+Engine?content=121881"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2')
makedepends=('libtool')
options=('!libtool')
source=("http://gnome-look.org/CONTENT/content-files/121881-equinox-$pkgver.tar.gz")
sha256sums=('0cf8b8cc841e0da7d4a08ab5a70d3bb330fd76bdcb03165a47aaddcd47e02227')

build() {
  cd "$srcdir/equinox-$pkgver"

  # toolbar fix
  sed -i "s/=\( EQUINOX_IS_TOOLBAR\)/= widget \&\&\1/" \
    src/equinox_style.c

  # glib2 fix
  sed -i "/gtimer/d" src/animation.c
        
  ./configure --prefix=/usr \
              --enable-animation
  make
}
package() {
  cd "$srcdir/equinox-$pkgver"
  make DESTDIR="$pkgdir/" install
}
