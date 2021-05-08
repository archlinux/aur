# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=idasen
pkgver=0.7.0
pkgrel=1
pkgdesc='Python API and CLI for the ikea IDÅSEN standing desk.'
url='https://github.com/newAM/idasen'
depends=('python' 'python-pyaml' 'python-bleak' 'python-voluptuous')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-cov')
makedepends=('python-setuptools' 'python-dephell')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/newAM/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('121fa9499bc9c3943caff8ff6fb1deb9af972097f434a4e7f64871c36b156142fbacd382b584920f14acc9423070d3f85c19fe206ebe44c5f7ba31ec4cc3a659')

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
