# Maintainer: trashstar <trash@ps3zone.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Tony Sokhon <tonyskn@gmail.com>
# Contributor: Ebubekir KARUL <ebubekirkarul@yandex.com>
# Contributor: Gaurish Sharma <contact@gaurishsharma.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Katrina L. Halliwell <rambaldi.kat.47@gmail.com>
# Contributor: Eugenio Ferreira <eugfcl@gmail.com>

pkgname=lighttable
pkgver=0.7.2
pkgrel=1
pkgdesc="New interactive IDE that lets you modify running programs and embed anything from websites to games."
url="http://www.lighttable.com/"
license=('MIT')
depends=("nss" "alsa-lib" "desktop-file-utils" "gconf" "libudev.so.0" "gtk2")
options=(!strip !emptydirs)
arch=('i686' 'x86_64')
install=$pkgname.install

source=(lighttable
        $pkgname-$pkgver-$CARCH.tar.gz::http://d35ac8ww5dfjyg.cloudfront.net/playground/bins/$pkgver/LightTableLinux64.tar.gz
        lighttable.desktop
        lighttable.png
        LICENSE)
md5sums=('e772b3547fdc3a6e32f81e7303422fd1'
         'e49c9c57d1dec787a58094cc7e6d3f63'
         '04a62702b59810a36bca7623bf9e932c'
         'f8c055be2f047ff4aaffdd028f62f027'
         '8870b5e12f58e6a19a53f4fa938755e8')
PKGEXT=".pkg.tar"

if [[ "$CARCH" == "i686" ]]; then
  source[1]=$pkgname-$pkgver-$CARCH.tar.gz::http://d35ac8ww5dfjyg.cloudfront.net/playground/bins/$pkgver/LightTableLinux.tar.gz
  md5sums[1]='999ca3e734ea1cf7b5f3dc190e914ad9'
fi

package() {
  install -Dm 755 "$srcdir/lighttable" "$pkgdir/usr/bin/lighttable"

  install -dm755 "$pkgdir/usr/share/licenses/lighttable"
  install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/lighttable/LICENSE"

  _destdir="$pkgdir/opt/LightTable"

  install -dm755 $_destdir
  mv $srcdir/LightTable/* $_destdir

  install -Dm 644 "$srcdir/lighttable.desktop" "$pkgdir/usr/share/applications/lighttable.desktop"
  install -Dm 644 "$srcdir/lighttable.png" "$pkgdir/usr/share/pixmaps/lighttable.png"
  install -Dm 644 "$pkgdir/opt/LightTable/core/node_modules/marked/man/marked.1" "$pkgdir/usr/share/man/man1/marked.1"
  rm "$pkgdir/opt/LightTable/core/node_modules/marked/man/marked.1"
}
