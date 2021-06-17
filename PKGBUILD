# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# pkg: pypi cleo
_name=cleo
pkgname=python-$_name-pypi
pkgver=0.8.1
pkgrel=3
pkgdesc='create beautiful and testable command-line interfaces'
provides=("python-cleo=$pkgver")
conflicts=("python-cleo")

arch=(any)
url=https://github.com/sdispater/cleo
license=(MIT)
depends=(
    'python'
	'python-clikit<0.7.0' #auto-deps
	'python-clikit>=0.6.0' #auto-deps
)

makedepends=(python-setuptools)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3d0e22d30117851b45970b6c14aca4ab0b18b1b53c8af57bed13208147e4069f')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package()
{
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
