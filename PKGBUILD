# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=soundconverter-git
pkgver=2.1.6.46.gfbc1713
pkgrel=3
pkgdesc="A simple sound converter application for GNOME from git repo"
arch=('any')
url="http://soundconverter.org/"
license=('GPL3')
depends=('pygtk' 'python2-libgnome' 'gstreamer0.10-python' 'gstreamer0.10-ugly-plugins'
	 'desktop-file-utils' 'gstreamer0.10-good-plugins')
makedepends=('git' 'perl-xml-libxml' 'intltool')
provides=('soundconverter')
conflicts=('soundconverter')
source=("git+https://github.com/kassoulet/soundconverter.git")
md5sums=('SKIP')
_gitname="soundconverter"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git describe --tags | sed 's|-|.|g'
}

build() {
  cd "$srcdir"/"$_gitname"
  PYTHON=python2 ./autogen.sh --prefix=/usr
  #  ./configure 
    make
  for _i in bin/${_gitname} ${_gitname}/*.py
  do
    sed -i 's#/usr/bin/python#/usr/bin/python2#' $_i
  done
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
