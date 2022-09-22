# Maintainer: gbr <gbr@protonmail.com>
# Contributor: masutu <masutu dot arch at gmail dot com>
pkgname=ezthumb
pkgver=3.6.7
pkgrel=5
pkgdesc='A video thumbnail generator based on ffmpeg'
arch=('x86_64')
url='https://sourceforge.net/projects/ezthumb/'
license=('GPL3')
depends=('ffmpeg4.4' 'gd' 'gtk2')
source=("$pkgname-$pkgver.tar.bz2::https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('1d04a1521204b25454b8a2cedf4150df9c3c7d68059ed5742d03f7a30060674e')

build() {
  cd "$pkgname-$pkgver"
  # No support for ffmpeg 5+
  export CPPFLAGS='-I/usr/include/ffmpeg4.4'
  export LDFLAGS='-L/usr/lib/ffmpeg4.4'
  ./configure --prefix=/usr --with-gui=gtk2
  # Required for IUP
  make EXTRAINCS='-I/usr/include/harfbuzz'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 'external/icons/SMirC-thumbsup.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

