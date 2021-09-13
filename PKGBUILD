# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kevin Andriessens <kevin@kelaun.be>

pkgname=python-aiohttp-rpc
_name="${pkgname#python-}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Library for integrating JSON-RPC 2.0 protocol with python-aiohttp"
arch=('any')
url="https://github.com/expert-m/aiohttp-rpc"
license=('MIT')
depends=('python>=3.6.5' 'python-aiohttp>=3' 'python-aiohttp<4')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$pkgname-LICENSE.txt::$url/raw/master/LICENSE.txt")
sha256sums=('93976e10376f274d9c5a947859b06de15650263968ab49e8fb197b24471f21fb'
            '9d9a5dcee434ec4bf90be2de273099a33e6213ff63d7c0db6e5b764128d8a9af')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 "$srcdir/$pkgname-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
