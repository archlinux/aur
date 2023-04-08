# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-scramp
pkgver=1.4.4
pkgrel=2
pkgdesc="Python implementation of the SCRAM protocol"
arch=(any)
url='https://github.com/tlocke/scramp'
license=("custom:MIT No Attribution")
depends=(python python-asn1crypto)
makedepends=(python-build python-installer python-setuptools python-versioningit python-wheel)
checkdepends=(python-pytest python-pytest-mock python-passlib)
source=("https://files.pythonhosted.org/packages/source/s/scramp/scramp-$pkgver.tar.gz"{,.asc})
sha256sums=('b7022a140040f33cf863ab2657917ed05287a807b917950489b89b9f685d59bc'
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
