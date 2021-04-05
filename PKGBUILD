# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=katcr
pkgver=3.0.7
pkgrel=1
pkgdesc='Search in multiple torrent sites from your CLI'
url='https://github.com/XayOn/katcr'
depends=('python' 'python-xdg>=5.0.1' 'python-feedparser' 'python-aiohttp' 'python-cleo' 'python-aiogram' 'python-torrentmirror' 'python-cutie')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-flake8' 'python-pytest-cov' 'python-pytest-sugar')
makedepends=('python-setuptools' 'python-dephell')
optdepends=('python-torrentstream: streaming support'
            'jackett: Jackett engine support'
            'xdg-utils: Use xdg-open to open magnet links')
license=('GPL3')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/XayOn/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('bda97dcdebb88d83c880a6ef97d1fd850ed088a160142bb5a501469279ce4706a13e8f376f087f0329553b107dccc981312e71221a40bb28bbd0b9bb5436efa8')

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
