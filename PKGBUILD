# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Joffrey <j-off@live.fr>

## GPG key: https://github.com/lepture.gpg

pkgname=python-captcha
_pkg="${pkgname#python-}"
pkgver=0.4
pkgrel=2
_commit=a666f57
pkgdesc='Library that generates audio and image CAPTCHAs'
arch=('any')
url='https://github.com/lepture/captcha'
license=('BSD')
depends=('python-pillow')
optdepends=('python-wheezy-captcha')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose' 'python-wheezy-captcha')
changelog=CHANGES
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('72F8E895A70CEBDF4F2ADFE07E55E3E0118B2B4C') ## Hsiaoming Yang

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	nosetests
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
