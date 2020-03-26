# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor:  Federico Cinelli <cinelli@aur.archlinux.org>

pkgname=gtkpod
pkgver=2.1.5
pkgrel=5
pkgdesc="A platform independent GUI for Apple's iPod using GTK3"
arch=('x86_64')
url='https://sourceforge.net/projects/gtkpod/'
license=('GPL')
depends=('libanjuta' 'curl' 'flac' 'libid3tag' 'libgpod' 'awk' 'hicolor-icon-theme' 'libmusicbrainz5' 'libdiscid' 'clutter-gtk' 'gst-plugins-base-libs')
makedepends=('flex' 'intltool' 'faad2' 'libvorbis')
optdepends=('libmp4v2: MP4/h264 support'
            'vorbis-tools: OGG support'
	    'libvorbis: OGG support'
            'id3v2: mp3 conversion support'
            'faad2: m4a conversion support')
source=("http://downloads.sourceforge.net/gtkpod/$pkgname-$pkgver.tar.gz")
sha256sums=('a57dc8ae9138e0cb4cee98691e7a95001130c9ea7823e6a75cc72503facd3a76')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's#python#python2#' scripts/sync-palm-jppy.py
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
