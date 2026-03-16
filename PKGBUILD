# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

_pkgname=picard
pkgname="${_pkgname}3"
pkgver=3.0.0a3
pkgrel=2
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
  'python-pygit2: plugin installation'
  'qt6-multimedia: media player toolbar'
  'qt6-translations: full UI translation'
)
source=("http://data.musicbrainz.org/pub/musicbrainz/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6702a323b7c917394911be9a5967ffaf29eae72690dfc28675a224f84998079e')

build() {
  cd $_pkgname-$pkgver
  PICARD_DISABLE_AUTOUPDATE=1  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS.txt,{CONTRIBUTING,NEWS,README}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
