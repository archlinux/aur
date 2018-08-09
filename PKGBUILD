# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-moto
_pkgname=moto
pkgver=1.3.4
pkgrel=1
pkgdesc="Moto is a library to mock out the boto library."
arch=('any')
url="https://github.com/spulec/moto"
license=('Apache')
depends=('python' 'python-aws-xray-sdk' 'python-boto' 'python-boto3' 'python-cookies' 'python-cryptography' 'python-dateutil' 'python-docker' 'python-jinja' 'python-jsondiff' 'python-jose' 'python-mock' 'python-pyaml' 'python-pytz' 'python-requests' 'python-responses' 'python-xmltodict' 'python-werkzeug')
checkdepends=('python-flask' 'python-freezegun' 'python-nose' 'python-sure' 'tk')
optdepends=('python-boto')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/spulec/moto/archive/$pkgver.tar.gz"
        moto-py37.patch::"https://github.com/spulec/moto/pull/1733.patch"
        remove-dep-upper-bounds.patch)
sha256sums=('466aa38894885f1d4a3c0e84746b81007057e226dbfc33a9dc7e3baa9b69f791'
            '37eb06f92cd92300cdc33d8639f0239d453680afc80abaf6ab78a1cbf6ceb0ab'
            'f7c965571483b5b77419b0448ec98675bf4ec2b657c95dc7320d1eb1f2b81fb9')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  patch -Np1 -i ../moto-py37.patch

  patch -Np1 -i ../remove-dep-upper-bounds.patch
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  nosetests -sv ./tests/ --exclude='test_iot.*' --exclude='test_lambda.*'
}
# vim:ts=2:sw=2:et:ft=sh
