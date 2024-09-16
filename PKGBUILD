# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Marco Asa <marcoasa90[at]gmail[dot]com>

pkgname=linux-show-player
pkgver=0.6.4
pkgrel=1
pkgdesc='Cue player designed for stage productions'
url='https://www.linux-show-player.org/'
arch=(any)
license=(GPL-3.0-only)
depends=(gobject-introspection-runtime gst-plugins-good
         python-pyalsa python-appdirs python-falcon python-humanize
         python-pyliblo python-pyqt5 python-gobject python-mido
         python-requests python-rtmidi python-sortedcontainers qt5-svg)
makedepends=(python-build python-installer python-poetry python-wheel)
groups=(pro-audio)
optdepends=(
  'gst-libav: for larger format support'
  'gst-plugins-bad: for larger format support'
  'gst-plugins-ugly: for larger format support'
  'ola: for Art-Net timecode support'
  'python-jack-client: for JACK output support'
  'python-protobuf: for Art-Net timecode support'
)
options=('!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FrancescoCeruti/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9e90779b2509f6a1fe31c208d19e0500202bdf939695fe49ca97fb613d3b945e')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 dist/linuxshowplayer.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 dist/linuxshowplayer.png -t "$pkgdir"/usr/share/pixmaps
  install -Dm644 dist/linuxshowplayer.xml -t "$pkgdir"/usr/share/mime/packages
  install -Dm644 dist/linuxshowplayer.metainfo.xml -t "$pkgdir"/usr/share/metainfo
}
