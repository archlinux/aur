# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: TuxSpirit<tuxspirit@archlinux.fr>  2007/11/17 21:22:36 UTC
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=p7zip
pkgver=17.03
pkgrel=1
pkgdesc="Command-line file archiver with high compression ratio"
arch=('x86_64')
url="https://github.com/jinfeihan57/p7zip"
license=('LGPL' 'custom:unRAR')
depends=('gcc-libs' 'sh')
source=(https://github.com/jinfeihan57/p7zip/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('bb4b9b21584c0e076e0b4b2705af0dbe7ac19d378aa7f09a79da33a5b3293187')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make OPTFLAGS="$CPPFLAGS $CFLAGS" 7z 7zr 7za
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install \
    DEST_DIR="$pkgdir" \
    DEST_HOME=/usr \
    DEST_MAN=/usr/share/man

  # Remove documentation for the GUI file manager
  rm -r "$pkgdir/usr/share/doc/p7zip/DOC/MANUAL/fm"

  install -d "${pkgdir}"/usr/share/licenses/p7zip
  ln -s -t "$pkgdir/usr/share/licenses/p7zip/" \
    /usr/share/doc/p7zip/DOC/License.txt \
    /usr/share/doc/p7zip/DOC/unRarLicense.txt
}

# vim:set ts=2 sw=2 et:
