# Maintainer: Nico <d3sox at protonmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=sysmontask
_gitname=SysMonTask
pkgver=1.3.7
pkgrel=2
pkgdesc="System Monitor With UI Like Windows"
arch=('any')
url="https://github.com/KrispyCamel4u/SysMonTask"
license=('MIT')
depends=('python' 'python-psutil' 'python-gobject' 'python-cairo' 'python-matplotlib'
         'libwnck3' 'gtk3')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.patch")
sha256sums=('5ac1e48bd529a5fcb3475990bfb466ac4e840ee6c0a0fc11380a528df9b71a31'
            'b7dd084e8a7fbe1ba03b279ef36f1fcf66ed117f79755168c0d5de884c774132')

prepare() {
	cd "$_gitname-$pkgver"
	patch --strip=1 setup.py < "$srcdir/$pkgname.patch"
}

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
