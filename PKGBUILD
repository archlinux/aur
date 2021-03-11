# Maintainer: Nico <d3sox at protonmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=sysmontask
_gitname=SysMonTask
pkgver=1.1.1_beta_b
pkgrel=1
pkgdesc="System Monitor With UI Like Windows"
arch=('any')
url="https://github.com/KrispyCamel4u/SysMonTask"
license=('MIT')
depends=('python' 'python-psutil' 'python-gobject' 'python-cairo' 'libwnck3' 'gtk3')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('88e5a4b7c9a4c4a82e26c990f7df0f31d29c5b39a6e4fad9688566d2dc9cd1fc')

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
