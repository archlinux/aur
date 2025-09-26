# Maintainer: Malte Starostik <malte at starostik dot de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

## Do NOT build from source; upstream builds V8 from source
## and takes well over an hour and large amounts of disk space

pkgname=python-pyminiracer
_name=mini_racer
pkgver=0.12.4
pkgrel=1
pkgdesc='Minimal, modern embedded V8 for Python'
arch=('x86_64')
url="https://github.com/bpcreech/PyMiniRacer"
license=('ISC')
depends=('python')
makedepends=('python-installer')
source=("$url/releases/download/v$pkgver/$_name-$pkgver-py3-none-manylinux_2_31_x86_64.whl")
noextract=("$_name-$pkgver-py2.py3-none-manylinux1_x86_64.whl")
sha256sums=('69a1c44d02a9069b881684cef15a2d747fe0743df29eadc881fda7002aae5fd2')

package() {
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" $_name-$pkgver-py3-none-manylinux_2_31_x86_64.whl
	local _site
        _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_name-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
