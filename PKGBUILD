# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

_pkgname=picard
pkgname="${_pkgname}3"
pkgver=3.0.0a2
pkgrel=1
pkgdesc="Official MusicBrainz tagger"
arch=(x86_64)
url="https://github.com/metabrainz/picard"
license=(GPL-2.0-or-later)
provides=(picard)
conflicts=(picard)
depends=(
  glibc
  hicolor-icon-theme
  python
  python-dateutil
  python-discid
  python-fasteners
  python-markdown
  python-mutagen
  python-pyjwt
  python-pyqt6
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
optdepends=(
  'chromaprint: fingerprinting'
  'qt6-multimedia: media player toolbar'
  'qt6-translations: full UI translation'
)
source=("http://data.musicbrainz.org/pub/musicbrainz/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c581e17a2be2cff54e115b9f7a977c22adc18410c2023a8410ae107cb63f55e3')
b2sums=('bf2b17a09eea84c0364b341d6643e32b4d2fa594c669fa92bcc82c34f6ab382700a8c32120c96035b371690cb9b215d0e2df95f33ef7465707284f8db3a96e3a')

build() {
  cd $_pkgname-$pkgver
  PICARD_DISABLE_AUTOUPDATE=1  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS.txt,{CONTRIBUTING,NEWS,README}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
