# Maintainer: Philipp A. <flying-sheep@web.de>
_name=aiohttp
pkgname=python-aiohttp
pkgver=0.22.5
pkgrel=2
pkgdesc='http client/server for asyncio'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://pypi.python.org/pypi/$_name"
license=('Apache')
depends=('python>=3.5' 'python-chardet' 'python-multidict')
makedepends=('python-pip')

# binary packages
_wheelbase="$_name-$pkgver-cp35-cp35m-manylinux1"
source_i686=(  "https://files.pythonhosted.org/packages/cp35/${_name::1}/$_name/${_wheelbase}_i686.whl")
source_x86_64=("https://files.pythonhosted.org/packages/cp35/${_name::1}/$_name/${_wheelbase}_x86_64.whl")
md5sums_i686=('c7946d75ae80e417a3239ce2d1122732')
md5sums_x86_64=('f941018bc68d5b6b73a44e573ce7c4af')
noextract=("${_wheelbase}_"{i686,x86_64}.whl)

# source code package
_s="https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
source_arm=("$_s")
source_armv6h=("$_s")
source_armv7h=("$_s")
source_aarch64=("$_s")
_m=('8541b6085fee8f8b51e0144df6470186')
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
