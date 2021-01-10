# Maintainer: Philipp Joram <mail [at] phijor [dot] me>
# Contributor: bittin

pkgname=mopidy-soundcloud
pkgver=3.0.1
pkgrel=1
pkgdesc="Mopidy extension for playing music from SoundCloud"
arch=('any')
url="https://github.com/mopidy/mopidy-soundcloud"
license=('MIT')
depends=(
  'python'
  'python-requests'
  'python-pykka'
  'python-setuptools'
  'mopidy>=3.0'
)
checkdepends=(
  'python-pytest'
  'python-pytest'
  'python-vcrpy'
)
source=(
  "https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha512sums=('fb119464d7f9e5d7c89fcb8bbd9465ca7af452ec62a6b65477cdf58a87b192bea2dfdbf9e3708de904042fb6b79eed9091f90d8f42d07b7982687bb4e5ec9cc4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  pytest
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
