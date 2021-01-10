# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=mpdevil-git
pkgver=1.0.0.r0.ge8191ea
pkgrel=1
pkgdesc="A simple music browser for MPD (git version)"
arch=('any')
license=('GPL3')
url="https://github.com/SoongNoonien/mpdevil"
depends=('python-mpd2' 'gtk3' 'libnotify' 'python-gobject' 'python-requests' 'python-beautifulsoup4')
makedepends=('git' 'python-distutils-extra')
provides=('mpdevil')
conflicts=('mpdevil')
source=('git+https://github.com/SoongNoonien/mpdevil.git')
md5sums=('SKIP')
_gitname="mpdevil"

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

