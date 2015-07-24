# Contributor: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Mark Coolen <mark dot coolen at gmail dot com>

pkgname=luola
pkgver=1.3.2
pkgrel=2
pkgdesc="A cavern-flying game for 1-4 players"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl_image' 'sdl_ttf' 'sdl_gfx' 'sdl_mixer')
url="http://web.archive.org/web/20081206054041/http://www.luolamies.org/software/luola/"

source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
        "http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}-levels/${pkgname}-levels_6.0.orig.tar.gz"
        "http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}-nostalgy/${pkgname}-nostalgy_1.2.orig.tar.gz")
md5sums=('029f48e8fb8d104e9634cf20c4493460'
         '7660b90d67c06726c1849c3ff0e24aea'
         '4777681fa97ada351ebaf954ba8451ef')

package() {
 cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-sdl-gfx -enable-sound LIBS="-lm"
  make
  make prefix="$pkgdir/usr" install
  cd "$srcdir"
  install -Dm644 {*.png,*.lev} "$pkgdir/usr/share/luola/levels"
  install -Dm644 "$pkgname-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

