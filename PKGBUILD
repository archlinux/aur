# Maintainer: Spencer Muise <smuise@spencermuise.ca>

pkgname=plex-mpv-shim-git
_name=plex-mpv-shim
pkgver=v1.7.16.r3.ga92bb01
pkgrel=1
pkgdesc="Cast media from Plex Mobile and Web apps to MPV"
arch=('any')
url='https://github.com/iwalton3/plex-mpv-shim'
license=('MIT')
depends=(
  'python'
  'mpv'
  'python-mpv'
  'python-requests'
  'python-mpv-jsonipc'
)
optdepends=(
  'python-pystray'
  'tk'
)
makedepends=(
  'git'
  'python-setuptools'
)
source=("git+https://github.com/iwalton3/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_name
    python setup.py build
}

package() {
    cd $_name
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
