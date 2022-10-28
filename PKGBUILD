# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-scramp
pkgver=1.4.3
pkgrel=1
pkgdesc="Python implementation of the SCRAM protocol"
arch=(any)
url='https://github.com/tlocke/scramp'
license=("custom:MIT No Attribution")
depends=(python python-asn1crypto)
makedepends=(python-build python-installer python-setuptools python-versioningit python-wheel)
checkdepends=(python-pytest python-pytest-mock python-passlib)
source=("https://files.pythonhosted.org/packages/source/s/scramp/scramp-$pkgver.tar.gz"{,.asc})
sha256sums=('d6885e002707d12a1bcb1f6b243217f06253397afc4e9d970e1a4c009635d6cc'
            'SKIP')
validpgpkeys=(
  'D5681B7EC7292511C4CC1450892B00AB699851E8'  # Tony Locke <tlocke@tlocke.org.uk>, proven by https://keybase.io/tlocke
)

build() {
  cd scramp-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd scramp-$pkgver
  python -m pytest test
}

package() {
  cd scramp-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
