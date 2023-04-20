# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Maintainer:  Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gcstar
_pkgname=GCstar
pkgver=1.8.0
pkgrel=1
pkgdesc="A collection management application"
arch=('any')
url="https://gitlab.com/${_pkgname}/${_pkgname}"
license=('GPL')
depends=('perl-libwww' 'perl-xml-simple' 'perl-net-snmp' 'perl-xml-parser'
	 'perl-switch' 'perl-xml-libxml' 'perl-sort-naturally' 'perl-http-message'
	 'perl-http-date' 'perl-http-cookies' 'perl-gd' 'perl-date-calc'
	 'perl-lwp-protocol-https' 'perl-archive-zip' 'perl-datetime-format-strptime'
	 'perl-gdgraph' 'perl-mp3-info' 'perl-mp3-tag' 'perl-net-freedb'
	 'perl-ogg-vorbis-header-pureperl' 'hicolor-icon-theme' 'perl-gtk3-simplelist'
	 'perl-json' 'perl-locale-codes')
optdepends=('perl-image-exiftool:  to retrieve data from a mkv file')
source=($url/-/archive/v$pkgver/${_pkgname}-v$pkgver.tar.bz2)
sha256sums=('99a381277fa119db1541fed5a214ae28d879b449d44af607892ff4cac177ac66')

package() {
  cd ${_pkgname}-v$pkgver/$pkgname
  perl ./install --text --prefix="$pkgdir"/usr
  install -D -m644 "$pkgdir"/usr/share/gcstar/icons/gcstar_256x256.png \
                   "$pkgdir"/usr/share/pixmaps/gcstar.png
  install -D -m644 "$pkgdir"/usr/share/gcstar/icons/gcstar_32x32.png \
                   "$pkgdir"/usr/share/pixmaps/gcstar32.png
  cp -R share/applications "$pkgdir"/usr/share
# cleaning up 
  rmdir "$pkgdir"/usr/share/icons/hicolor/scalable/{apps,mimetypes}
  rmdir "$pkgdir"/usr/share/icons/hicolor/scalable/
  rm "$pkgdir"/usr/share/applications/mimeinfo.cache
  rm -rf "$pkgdir"/usr/share/mime
}
