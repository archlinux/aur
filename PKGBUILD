# Contributor: Javier Tiá <javier.tia _at_ gmail.com>

pkgname=fortune-mod-es
pkgver=1.32
pkgrel=2
pkgdesc="Fortune Cookies in Spanish, from the Debian project"
url="http://packages.debian.org/source/sid/fortunes-es"
depends=('fortune-mod')
makedepends=('recode')
groups=('fortune-mods')
source=(http://ftp.es.debian.org/debian/pool/main/f/fortunes-es/fortunes-es_1.32.tar.gz)
arch=('any')
license=('custom')
md5sums=('64253befebcb6fca340e9a65230ee878')


package() {
  cd $srcdir/fortunes-es-$pkgver
  make COOKIEDIR="$pkgdir/usr/share/fortune/" STRFILE="/usr/bin/strfile" install-utf8 || return 1

  # Remove *.u8 files and strip ".fortunes" from filenames
  cd $pkgdir/usr/share/fortune/
  rm *.u8 off/*.u8
  for f in *.fortunes* off/*.fortunes*; do
    mv $f ${f/.fortunes}
  done

  cd $srcdir/fortunes-es-$pkgver
  install -D -m644 debian/copyright $startdir/pkg/usr/share/licenses/$pkgname/LICENSE || return 1
}
# vim: set ft=sh ts=2 et:
