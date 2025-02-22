# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=moDllz
_name=moDllz
pkgname=vcvrack-modllz
pkgver=2.1.2
pkgrel=1
pkgdesc='moDllz VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/dllmusic/moDllz'
license=(GPL-3.0-or-later CC-BY-NC-ND-4.0)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
_commit=7a038e02ba175a524a16ac5e2f9e3d2baac2066f
source=("git+https://github.com/dllmusic/$_name#commit=$_commit")
sha256sums=('7169e540b79d17a3e96cb52566e714dd5d1b93c37f35dbc17dac855d3fc03b13')

prepare() {
  cd $_name
  # remove common license
  rm LICENSE-GPLv3
}

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname
}
