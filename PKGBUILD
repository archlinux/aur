# Maintainer: Pedro Ribeiro Mendes Júnior <pedrormjunior@gmail.com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Javier Tiá <javier.tia _at_ gmail.com>

pkgname=fortune-mod-es
pkgver=1.36
_debver=$pkgver+nmu1
pkgrel=2
pkgdesc="Fortune Cookies in Spanish, from the Debian project"
url="https://packages.debian.org/source/sid/fortunes-es"
depends=('fortune-mod')
makedepends=('recode')
groups=('fortune-mods')
source=(http://ftp.es.debian.org/debian/pool/main/f/fortunes-es/fortunes-es_$_debver.tar.xz)
arch=('any')
license=('custom')
md5sums=('64489a8fdb1a50f63d1e679df483fe61')


package() {
  cd $srcdir/fortunes-es-$_debver
  make COOKIEDIR="$pkgdir/usr/share/fortune/" STRFILE="/usr/bin/strfile" install-utf8 || return 1

  # Remove *.u8 files and strip ".fortunes" from filenames
  cd $pkgdir/usr/share/fortune/
  rm *.u8 off/*.u8
  for f in *.fortunes* off/*.fortunes*; do
    mv $f ${f/.fortunes}
  done

  cd $srcdir/fortunes-es-$_debver
  install -D -m644 debian/copyright $pkgdir/pkg/usr/share/licenses/$pkgname/LICENSE || return 1
}
