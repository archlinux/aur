# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

_pkgname=radiotray
pkgname=${_pkgname}-python3-git
pkgver=0.7.3.498.3ef60fd
pkgrel=1
pkgdesc="An online radio streaming player that runs on a Linux system tray."
arch=(any)
url="http://radiotray.sourceforge.net/"
license=(GPL)
depends=('gst-plugins-base' 'gtk3' 'libnotify' 'python-xdg' 'python-dbus' 'gst-plugins-good' 'python-lxml')
optdepends=('gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
makedepends=('git')
provides=(radiotray)
conflicts=('radiotray' 'radiotray-svn' 'radiotray-hg')

source=('git+https://github.com/lubosz/radiotray.git')
md5sums=('SKIP')
_gitname='radiotray'

pkgver() {
  cd $_gitname
  version=$(grep "APPVERSION =" src/lib/common.py | sed 's/    APPVERSION = "//' | sed 's/"//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $version.$revision.$hash  
}

build() {
  cd $_gitname
  python setup.py build
}

package() {
  cd $_gitname
	python setup.py install --root=$pkgdir/ --optimize=1

	chmod +x $pkgdir/usr/bin/radiotray
	find $pkgdir -perm 600 -exec chmod 644 {} \;
}
