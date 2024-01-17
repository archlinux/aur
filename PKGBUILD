# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor:  Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gcstar
_name=GCstar
pkgver=1.8.0
pkgrel=3
pkgdesc="Collection manager written in Perl and based on GTK"
arch=(any)
url="https://gitlab.com/GCstar/GCstar"
license=(GPL-2.0-or-later)
depends=(
  hicolor-icon-theme
  perl
  perl-archive-zip
  perl-date-calc
  perl-datetime-format-strptime
  perl-gd
  perl-gdgraph
  perl-gtk3-simplelist
  perl-http-cookies
  perl-http-date
  perl-http-message
  perl-json
  perl-libwww
  perl-locale-codes
  perl-lwp-protocol-https
  perl-mp3-info
  perl-mp3-tag
  perl-net-freedb
  perl-net-snmp
  perl-ogg-vorbis-header-pureperl
  perl-sort-naturally
  perl-switch
  perl-xml-libxml
  perl-xml-parser
  perl-xml-simple
)
optdepends=('perl-image-exiftool: Retrieve data from mkv files')

source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$_name-v$pkgver.tar.gz")
sha256sums=('6e62db6f7a4ca0b2c1bd06c9cff57dae620819dd74f7c1ce5a8d21099f352c1a')

_archive="$_name-v$pkgver"

package() {
  cd "$_archive/gcstar"

  perl ./install --text --prefix="$pkgdir/usr"

  cp --archive --no-preserve=ownership share/applications "$pkgdir/usr/share"

  install -Dm644 "$pkgdir/usr/share/gcstar/icons/gcstar_256x256.png" "$pkgdir/usr/share/pixmaps/gcstar.png"
  install -Dm644 "$pkgdir/usr/share/gcstar/icons/gcstar_32x32.png" "$pkgdir/usr/share/pixmaps/gcstar32.png"

  rm -r \
    "$pkgdir/usr/share/icons/hicolor/scalable" \
    "$pkgdir/usr/share/mime"
  rm "$pkgdir/usr/share/applications/mimeinfo.cache"
}
