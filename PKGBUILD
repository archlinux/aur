# Maintainer: Thiago Perrotta <tbperrotta@gmail.com>
# Maintainer: stickynotememo <samk26633@gmail.com>
pkgname=i3a
_name=${pkgname#python-}
pkgver=2.4.0
pkgrel=1
pkgdesc="a set of scripts used for automation of i3 and sway window manager layouts"
arch=('any')
url="https://pypi.org/project/i3a"
license=('GPL')
groups=('i3')
depends=('python-i3ipc')
makedepends=('python-build' 'python-installer' 'python-hatchling')
optdepends=(
  'i3-wm: for X11 setup'
  'xorg-xprop: for X11 setup'
  'sway: for Wayland setup'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('05c180145ab75048f8a3b9cd43d692b6e78a99e0cd22a488aa461686cd939ea8')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
