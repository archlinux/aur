# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=katcr
pkgver=3.0.6
pkgrel=3
pkgdesc='Search in multiple torrent sites from your CLI'
url='https://github.com/XayOn/katcr'
depends=('python' 'python-xdg>=5.0.1' 'python-feedparser' 'python-aiohttp' 'python-cleo' 'python-aiogram' 'python-torrentmirror-git' 'python-cutie-git')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-flake8' 'python-pytest-cov' 'python-pytest-sugar')
makedepends=('python-setuptools' 'python-dephell')
license=('GPL3')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/XayOn/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('8026ee6aa1bb6bcd449ea18f25759ba12a233afb24e2c4ca17ceb1e591fb5c680a72aab2896f7d8bae5f6b008c7c6b219c545a23ccb8dbd32f14a2e8d0c312f9')

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
}
# vim:set ts=2 sw=2 et:
