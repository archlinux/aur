# Maintainer: Nico <d3sox at protonmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=sysmontask
_gitname=SysMonTask
pkgver=1.1.1_beta
pkgrel=2
pkgdesc="System Monitor With UI Like Windows"
arch=('any')
url="https://github.com/KrispyCamel4u/SysMonTask"
license=('MIT')
depends=('python' 'python-psutil>=5.8' 'python-gobject' 'python-cairo'
         'libwnck3' 'gtk3' 'zenity')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d7d184678886e46efc51ea2c890e0496c0871e0674b804dc4b3cb2027a74f13b')

build() {
	cd "$_gitname-$pkgver"
	python setup.py build
}

package() {
	cd "$_gitname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/share/doc/$pkgname/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname"
}
