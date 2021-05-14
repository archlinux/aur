# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=python-pulsectl
_name=${pkgname#python-}
pkgver=21.5.12
pkgrel=1
epoch=1
pkgdesc="Python high-level interface and ctypes-based bindings for PulseAudio (libpulse)"
arch=('any')
url="https://github.com/mk-fg/python-pulse-control"
license=('MIT')
depends=('python' 'libpulse')
makedepends=('python-setuptools')
conflicts=('python-pulse-control')
replaces=('python-pulse-control')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4c5475c385a9b9c6fda3004fc5ac0f9a48c92cc845bc3f3cc20cd8132765e027')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

# Test fails in chroot
#check() {
#	cd "$_name-$pkgver"
#	python -m unittest discover
#}

package() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
