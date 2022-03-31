# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=idasen
pkgver=0.8.3
pkgrel=1
pkgdesc='Python API and CLI for the ikea IDÅSEN standing desk.'
url='https://github.com/newAM/idasen'
depends=('python' 'python-pyaml' 'python-bleak' 'python-voluptuous')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-cov')
makedepends=('python-setuptools' 'python-dephell')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/newAM/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('a0a68dc9a4f6573ab85f5cd9c87f11f4384533effee0b7f7d15f14b0bc51f260eac912d6804493819fa4f2e8d8cbc3b82412c42b16a06941e1a1e4ac8efd96c3')

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
