# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=rapid-photo-downloader-git
pkgver=0.9.34.r19.g851ee2d6
pkgrel=2
pkgdesc="Photo and video downloader"
arch=('any')
url="http://www.damonlynch.net/rapid/"
license=('GPL3')
depends=('desktop-file-utils' 'gstreamer' 'hicolor-icon-theme' 'libgexiv2' 'libnotify' 'python-arrow'
         'perl-image-exiftool' 'python-colour' 'python-dateutil' 'python-easygui' 'python-gobject'
         'python-gphoto2' 'python-psutil' 'python-pymediainfo' 'python-pyqt5' 'python-pyzmq'
         'python-requests' 'python-setuptools' 'python-sortedcontainers' 'python-babel'
         'python-tornado' 'python-pyxdg' 'qt5-imageformats' 'udisks2' 'python-tenacity' 'qt5-svg'
         'python-show-in-file-manager' 'python-types-python-dateutil')
# added temporary 'python-types-python-dateutil' depends because it's a missing
# dependencie for -arrow package and rapid doesn't start without it.
# https://bugs.archlinux.org/task/79981
makedepends=('git' 'intltool' 'ifuse')
optdepends=('ifuse: for iOS devices')
provides=("${pkgname%-*}=${pkgver%.r*}")
conflicts=("${pkgname%-*}")
replaces=('rapid-photo-downloader-bzr')
source=('git+https://github.com/damonlynch/rapid-photo-downloader.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "${pkgname%-*}"
  python setup.py build
}

package() {
  cd "${pkgname%-*}"
  python setup.py install --root="$pkgdir" --optimize=1
}
