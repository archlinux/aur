# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer:  Federico Cinelli <cinelli@aur.archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=gtkpod
pkgver=2.1.5
pkgrel=4
pkgdesc="A platform independent GUI for Apple's iPod using GTK3"
arch=('x86_64')
url="http://gtkpod.sourceforge.net"
license=('GPL')
depends=('libanjuta' 'curl' 'flac' 'libid3tag' 'libgpod' 'awk' 'hicolor-icon-theme' 'libmusicbrainz5' 'libdiscid' 'clutter-gtk' 'gst-plugins-base-libs')
makedepends=('flex' 'intltool' 'faad2' 'libvorbis')
optdepends=('libmp4v2: MP4/h264 support'
            'vorbis-tools: OGG support'
	    'libvorbis: OGG support'
            'id3v2: mp3 conversion support'
            'faad2: m4a conversion support')
source=("http://downloads.sourceforge.net/gtkpod/$pkgname-$pkgver.tar.gz")
md5sums=('f011d6bc403f06d8bb13829c1c3d25fe')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's#python#python2#' scripts/sync-palm-jppy.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
