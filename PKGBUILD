# Maintainer: <https://aur.archlinux.org/account/zeauw>

_name=ligo-segments
pkgname=python-${_name}
pkgver=1.4.0
pkgrel=1
arch=('any')
url='https://pypi.org/project/ligo-segments'
license=('GPLv3')
depends=('python-six')
makedepends=('python-setuptools' 'gcc')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/81/60/8de5c89e4e5fc760649cee0c773418ecc920c3dae21ac5656fd3e5e21a9d/ligo-segments-${pkgver}.tar.gz"
    "0001-set-types.patch")
sha256sums=('e072a844713c5b02efdcaf5bfe4c3a8cd9ef225b08cfd3202a4e185e0f71f5dc'
    'f3189cae4f9178c9424e89c33ea2647661b0e1a98ed6a1412f6e44152c3d821e')

build() {
    cd ${_name}-${pkgver}
    patch -p1 < ../0001-set-types.patch
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
