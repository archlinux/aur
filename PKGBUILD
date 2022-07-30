# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=idasen
pkgver=0.9.0
pkgrel=1
pkgdesc='Python API and CLI for the ikea IDÅSEN standing desk.'
url='https://github.com/newAM/idasen'
depends=('python' 'python-pyaml' 'python-bleak' 'python-voluptuous')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-cov')
makedepends=('python-setuptools' 'python-dephell')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/newAM/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('9a8ccf2a6e0d026b741f38710b0713765d18aaec869d4637d74c9eaf1c71b4b8cdf06f3dcca12490ebad2a8ff4f5e8e635aea2110e93a7d5c834efbba9d6ea5b')

prepare() {
	cd "${srcdir}/$pkgname-$pkgver"

	dephell deps convert --from pyproject.toml --to setup.py
}

build(){
  cd "${srcdir}/$pkgname-$pkgver"

  python setup.py build
}

check(){
    cd "${srcdir}/$pkgname-$pkgver"

    pytest
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
