# Maintainer: Philipp Joram <mail [at] phijor [dot] me>
# Contributor: bittin

pkgname=mopidy-soundcloud
pkgver=3.0.2
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
  'python-beautifulsoup4'
  'mopidy>=3.0'
)
checkdepends=(
  'python-pytest'
  'python-pytest'
  'python-vcrpy'
)
source=(
  "${pkgname}-${pkgver}::https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha512sums=('75c9c023370df6b3cb3c2b16aad66e3662f25372d4dc701c16c96db29853fcb77a25eed932f4f48f4e317995c504c2b00fe3d5ee816385ad1f7daa012917f2cc')

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
