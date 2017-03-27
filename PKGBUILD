# Maintainer: Philipp A. <flying-sheep@web.de>
_name=aiohttp
pkgname=python-aiohttp
pkgver=2.0.3
pkgrel=1
pkgdesc='http client/server for asyncio'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://$_name.readthedocs.io"
license=('Apache')
depends=('python>=3.4.2' 'python-chardet' 'python-multidict' 'python-async-timeout' 'python-yarl')
makedepends=('python-pip')

# binary packages
_wheelbase="$_name-$pkgver-cp36-cp36m-manylinux1"
source_i686=(  "https://files.pythonhosted.org/packages/cp36/${_name::1}/$_name/${_wheelbase}_i686.whl")
source_x86_64=("https://files.pythonhosted.org/packages/cp36/${_name::1}/$_name/${_wheelbase}_x86_64.whl")
md5sums_i686=('ba39851bce2cb8278167fd25f50566f7')
md5sums_x86_64=('b989cfaf72ce364e5e23858e2d866e6b')
noextract=("${_wheelbase}_"{i686,x86_64}.whl)

# source code package
_s="https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
source_arm=("$_s")
source_armv6h=("$_s")
source_armv7h=("$_s")
source_aarch64=("$_s")
_m=('a8200672a581211a196a1419d2dcf9b8')
md5sums_arm=("$_m")
md5sums_armv6h=("$_m")
md5sums_armv7h=("$_m")
md5sums_aarch64=("$_m")

package() {
	case "$CARCH" in
		i686|x86_64)
			cd "$srcdir"
			pip install --compile --no-deps --ignore-installed --root="$pkgdir" "${_wheelbase}_$CARCH.whl"
			;;
		*)
			cd "$srcdir/$_name-$pkgver"
			python setup.py install --root="$pkgdir/" --optimize=1
			;;
	esac
}
