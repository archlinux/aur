# Maintainer: Tobias Manske <aur@rad4day.de>
pkgname=pferd
pkgver=3.2.0
pkgrel=1
pkgdesc='Tool for fast and easily downloading data from KIT Ilias'
arch=('any')
url='https://github.com/Garmelon/PFERD'
license=('MIT')
depends=('python3' 'python-aiohttp' 'python-beautifulsoup4' 'python-rich' 'python-keyring' 'python-certifi')
makedepends=('python-setuptools' 'python-dephell')
source=($pkgname-$pkgver.tar.gz::https://github.com/Garmelon/PFERD/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('cba076f6c0f4395d17a7e0dc88c31c7f05a71dc8758eccaac1e0230a3bf5a5b1')

prepare() {
  cd "PFERD-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "PFERD-$pkgver"
  python setup.py build
}

package() {
  cd "PFERD-$pkgver"
  python setup.py install --root="$pkgdir" --optimize 1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/MIT
}
