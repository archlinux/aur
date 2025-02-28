# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=QuantalAudio
_name=quantal-audio
pkgname=vcvrack-quantal-audio
pkgver=2.2.2
pkgrel=2
pkgdesc='QuantalAudio VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/sumpygump/quantal-audio'
license=(GPL-3.0-or-later OFL-1.1)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/sumpygump/$_name#tag=$pkgver")
sha256sums=('ad4e3b68874be6e98321776f553b866200f66c91d424169144615a529061738d')

prepare() {
  cd $_name
  # remove common license
  rm LICENSE.txt
}

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins

  # install font license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv -v "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/res/fonts/EnvyCodeR-LICENSE.md \
    "$pkgdir"/usr/share/licenses/$pkgname
}
