# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-scramp
pkgver=1.4.4
# curl $(curl https://api.github.com/repos/tlocke/scramp/git/ref/tags/$pkgver | jq -r .object.url) | jq -r .object.sha
_commit=10a1f8491247b13f6e87a6a05ab0cc6b9288b6ac
pkgrel=3
pkgdesc="Python implementation of the SCRAM protocol"
arch=(any)
url='https://github.com/tlocke/scramp'
license=("custom:MIT No Attribution")
depends=(python python-asn1crypto)
makedepends=(git python-build python-installer python-setuptools python-versioningit python-wheel)
checkdepends=(python-pytest python-pytest-mock python-passlib)
source=("git+https://github.com/tlocke/scramp.git?signed#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=(
  'D5681B7EC7292511C4CC1450892B00AB699851E8'  # Tony Locke <tlocke@tlocke.org.uk>, proven by https://keybase.io/tlocke
)

pkgver() {
  cd scramp
  git describe --tags
}

build() {
  cd scramp
  python -m build --wheel --no-isolation
}

check() {
  cd scramp
  python -m pytest test
}

package() {
  cd scramp
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
