# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=colorhug-client-git
pkgver=0.2.1.r12.g7c4bded
pkgrel=1
pkgdesc="Calibration client for the Hughski ColorHug device"
arch=('i686' 'x86_64')
url="http://github.com/hughski/colorhug-client"
license=('GPL')
groups=()
depends=('glib2>=2.31.10' 'libgusb>=0.1.2' 'gtk3>=2.91.0' 'colord-git'
'colord-gtk>=0.1.24' 'libsoup>=2.4' 'libcanberra>=0.10' 'itstool' 'gnome-common'
'perl-xml-libxml' 'intltool>=0.50')
makedepends=('pkg-config' 'intltool' 'docbook2x')
provides=('colorhug-client')
conflicts=('colorhug-client')
install=colorhug-client.install
source=('colorhug-client::git+git://github.com/hughski/colorhug-client.git' $pkgname.patch)
md5sums=('SKIP'
         '229985bbb974ffb9b3da245179525fff')
_gitname=colorhug-client

prepare() {
  cd "$srcdir/$_gitname"
	patch -p1 -i "$srcdir/$pkgname.patch"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/_/./g;s/COLORHUG.CLIENT.//g'
}

# vim:set ts=2 sw=2 et:
