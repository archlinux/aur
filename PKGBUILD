# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-pynput
_name=${pkgname#python-}
pkgver=1.7.3
pkgrel=2
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
depends=('python-xlib' 'python-six' 'python-evdev')
makedepends=('python-setuptools-lint')
optdepends=('python-sphinx: build online documentation')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        "$pkgname.patch")
sha256sums=('4e50b1a0ab86847e87e58f6d1993688b9a44f9f4c88d4712315ea8eb552ef828'
            'b2e10f5baf1501e8365b1a95fd756cde5a8510107d89557ab764a47c3ef47226')

prepare() {
	cd "$_name-$pkgver"
	patch -Np1 -i "$srcdir/python-pynput.patch"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	# Fix permissions
	find "$pkgdir" -type d -exec chmod -v 0755 {} \;
	find "$pkgdir" -type f -exec chmod -v 0644 {} \;
}
