# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=bracket
pkgver=1.0.0
pkgrel=2
pkgdesc="High-dynamic-range (HDR) photo manager"
arch=('i686' 'x86_64')
url="http://www.ceng.metu.edu.tr/~akyuz/bracket/bracket.html"
license=('custom')
depends_i686=('libx11')
depends_x86_64=('lib32-gcc-libs' 'lib32-libx11')
source=(http://www.ceng.metu.edu.tr/~akyuz/bracket/bracket.tgz \
        bracket.sh bracket.desktop LICENSE)
# it's easier to package when it's not extracted because
# everything is extracted into top-level directory
noextract=(bracket.tgz)
md5sums=('29651962bc79ee06f226f74a7fa2ec95'
         '44843e54070c6ceb3edfd1a40733fa84'
         '2329f492f602dbe473d5bc61beef8c9a'
         'cff557f101a7d2c7e5b066f4687df3f1')

package() {
  cd "$srcdir"
  install -d -m755 "$pkgdir"/opt/$pkgname
  bsdtar -C "$pkgdir"/opt/$pkgname -xf $SRCDEST/bracket.tgz

  install -D -m755 bracket.sh "$pkgdir"/usr/bin/bracket
  install -D -m755 bracket.desktop "$pkgdir"/usr/share/applications/bracket.desktop

  # fix permissions
  find "$pkgdir"/opt/$pkgname -type d -exec chmod 755 '{}' '+'
  find "$pkgdir"/opt/$pkgname -type f -exec chmod 644 '{}' '+'
  chmod 755 "$pkgdir"/opt/$pkgname/bracket

  # install license taken from the homepage (it's in the footer)
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
