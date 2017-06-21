# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Gabor Nyekhelyi (n0gabor) <n0gabor@vipmail.hu>

pkgname=pitivi-git
pkgver=0.98.7539.c7e8c309
pkgrel=1
pkgdesc='Pitivi allows users to easily edit audio/video projects based on the GStreamer framework (Git version)'
arch=('any')
license=('LGPL')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gobject-introspection' 'python' 'python-gobject' 'goocanvas' 'gst-python' 'gst-editing-services' 'python-xdg' 'desktop-file-utils' 'hicolor-icon-theme' 'python-numpy' 'gst-transcoder-git' 'python-matplotlib' 'python-cairo' 'gst-validate')
makedepends=('automake' 'libtool' 'intltool' 'itstool' 'pygobject-devel' 'gtk-doc' 'gnome-doc-utils' 'yelp-tools')
optdepends=('python-pycanberra-git: sound notifications')
install=pitivi-git.install
provides=('pitivi')
conflicts=('pitivi')
url='http://www.pitivi.org/'

source=('git://git.gnome.org/pitivi')
_gitname='pitivi'
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  
  version=$(git describe --abbrev=0)
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash  
}

build() {
  cd $_gitname
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
  install -D -m644 mesonbuild/data/pitivi.desktop "$pkgdir/usr/share/applications/pitivi.desktop"
}
