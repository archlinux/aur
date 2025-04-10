# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
_projectname='azure-keyvault-secrets'
pkgname="python-$_projectname"
pkgver='4.9.0'
pkgrel='2'
pkgdesc="Microsoft Azure Key Vault Secrets Client Library for Python"
arch=('any')
_baseurl="https://github.com/Azure/azure-sdk-for-python"
url="$_baseurl/tree/main/sdk/keyvault/$_projectname"
license=('MIT')
depends=(
    'python-azure-core>=1.31.0' 'python-azure-core<2.0.0'
    'python-isodate>=0.6.1'
    'python-typing_extensions>=4.10.0'
)

makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$_baseurl/archive/${_projectname}_$pkgver.tar.gz")
sha256sums=('08806f4f4ea3a3a1d03b2217a440d9df247f41d9c3ac47d6c146f7313f357989')

_sourcedirectory="azure-sdk-for-python-${_projectname}_$pkgver/sdk/keyvault/$_projectname"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

package(){
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
