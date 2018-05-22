# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=rapid-photo-downloader-bzr
pkgver=0.9.9.r1075
pkgrel=2
pkgdesc="Photo and video downloader"
arch=('any')
url="http://www.damonlynch.net/rapid/"
license=('GPL3')
depends=('desktop-file-utils' 'gstreamer' 'hicolor-icon-theme'
         'libgexiv2' 'libgudev' 'libnotify' 'perl-image-exiftool'
         'python-arrow' 'python-colour' 'python-colorlog'
         'python-dateutil' 'python-distutils-extra' 'python-easygui'
         'python-gobject' 'python-gphoto2' 'python-psutil'
         'python-pymediainfo' 'python-pyprind' 'python-pyqt5'
         'python-pyzmq' 'python-rawkit' 'python-sortedcontainers'
         'python-tornado' 'python-xdg' 'qt5-imageformats' 'udisks2')
makedepends=('bzr' 'gobject-introspection' 'intltool' 'python-setuptools')
optdepends=('gst-libav: for extra video thumbnails'
            'gst-plugins-good: for extra video thumbnails')
provides=("${pkgname%-*}=${pkgver%.*}")
conflicts=("${pkgname%-*}")
source=('rapid::bzr+https://code.launchpad.net/~dlynch3/rapid/zeromq_pyqt')
sha256sums=('SKIP')

pkgver() {
  cd rapid
  version=$(grep -oP "__version__ = '\K[^']+" raphodo/__about__.py)
  printf "%s.r%s" "$version" "$(bzr revno)"
}

build() {
  cd rapid
  python setup.py build
}

package() {
  cd rapid
  python setup.py install --root="$pkgdir" --optimize=1
}
