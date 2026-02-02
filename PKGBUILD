# Maintainer: Malte Starostik <malte at starostik dot de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

## Do NOT build from source; upstream builds V8 from source
## and takes well over an hour and large amounts of disk space

pkgname=python-pyminiracer
_name=mini-racer
pkgver=0.14.1
pkgrel=1
pkgdesc='Minimal, modern embedded V8 for Python'
arch=('x86_64')
url="https://github.com/bpcreech/PyMiniRacer"
license=('ISC')
depends=(python python-typing_extensions)
makedepends=(python-installer)
_py=py3
_glibc=2_27
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-none-manylinux_${_glibc}_x86_64.whl")
sha256sums=('cdf3a088e1363f16a695288f882abf76b3705b8e1df21418208b87ed010037a4')

package() {
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" ${_name//-/_}-$pkgver-$_py-none-manylinux_${_glibc}_x86_64.whl
	local _site
        _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/${_name//-/_}-$pkgver.dist-info/licenses/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
