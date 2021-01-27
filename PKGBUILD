# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=idasen
pkgver=0.6.0
pkgrel=1
pkgdesc='Python API and CLI for the ikea IDÅSEN standing desk.'
url='https://github.com/newAM/idasen'
depends=('python' 'python-pyaml' 'python-bleak' 'python-voluptuous')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-cov')
makedepends=('python-setuptools' 'python-dephell')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/newAM/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2ccae7c73fa163c825fe729bd16abbdeef4c8fa52fcc91cfa532f93c2fd85100')

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
