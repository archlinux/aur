# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Janosch Dobler <janosch.dobler [at} gmx [dot} de>

pkgname=write_stylus
pkgver=300.r403
pkgrel=1
pkgdesc="Write(orignal name) - A word processor for handwriting"
arch=(i686 x86_64)
url="http://www.styluslabs.com/"
license=('custom')
depends=(sdl2)
makedepends=(desktop-file-utils)
source=("${pkgname}-${pkgver}.tar.gz"::"http://www.styluslabs.com/write/write-latest.tar.gz"
		"http://www.styluslabs.com/write/eula.docx")
md5sums=('fddf15e8c15d935b21be4bf624b04a32'
         'fafaef86844ead59b3837a5909bf780f')
noextract=("eula.docx")

pkgver() {
  echo -n '300.'
  strings "$srcdir/Write/Write" | grep -oP 'Write \Kr[0-9]+'
}

prepare() {
  desktop-file-edit --set-key=Exec --set-value=/usr/bin/write_stylus "$srcdir/Write/Write.desktop"
  desktop-file-edit --set-key=Icon --set-value=/usr/share/icons/hicolor/144x144/apps/write_stylus.png "$srcdir/Write/Write.desktop"
}

package() {
  install -Dm755 "$srcdir/Write/Write" "$pkgdir/usr/local/write_stylus/Write"
  install -m644 "$srcdir/Write/"{DroidSansFallback.ttf,Intro.svg,Roboto-Regular.ttf} "$pkgdir/usr/local/write_stylus/"

  install -dm755 "$pkgdir/usr/bin/"
  ln -s /usr/local/write_stylus/Write "$pkgdir/usr/bin/write_stylus"

  install -Dm644 "$srcdir/eula.docx" "$pkgdir/usr/share/licenses/write_stylus/eula.docx"
  install -Dm644 "$srcdir/Write/Write.desktop" "$pkgdir/usr/share/applications/Write.desktop"
  install -Dm644 "$srcdir/Write/Write144x144.png" "$pkgdir/usr/share/icons/hicolor/144x144/apps/write_stylus.png"
}

# vim:set ts=2 sw=2 et:
