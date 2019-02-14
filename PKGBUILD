# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Thibault Mondary <thibm@free.fr>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=crack-attack
pkgver=1.1.14
pkgrel=8
pkgdesc="A free OpenGL game based on the Super Nintendo classic Tetris Attack, with Fedora's patches"
arch=('i686' 'x86_64')
url="https://www.nongnu.org/crack-attack/"
license=("GPL")
depends=('gtk2' 'sdl_mixer' 'freeglut')
makedepends=('glu' 'libxmu')
optdepends=('crack-attack-sounds: for sound effects and music')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver-audio.patch"
        "$pkgname-$pkgver-audio-ppc.patch"
        "$pkgname-$pkgver-format-security.patch"
        "$pkgname-$pkgver-gcc43.patch"
        "$pkgname-$pkgver-glutInit.patch"
        "$pkgname-$pkgver-rhbz1065649.patch"
        "$pkgname-$pkgver-sanitize.patch")
sha256sums=('75ca48e5cf7d49a301d0d6a4f61bf38c2d30308a1d4f7adacdab002c549253e9'
            '230339388298d794a307f5f01cc9d9f156322a28c0e497ab83b2d2df5a960e85'
            '5b86a81a91c434fc98002652ed3458d17ba12ab1aaa3647c85ba965252f157f8'
            '938778c17119fe59d6ed69ce11bf16d1253999c92f7a10305aecd66982df0dd0'
            '2a8e430316f0fbe3360b1fa7793345812d7c61aca2197a1a2e521ea7df42a608'
            '6128b4737a39b708a5107a41ab389a653eac33023f0e1bd3791d67424fcb6ee4'
            '3a82f216b4f580b7b774a89cba1eada266f4fd8c3b582b244bded2566b453cbf'
            '7897febe5fbff88f807d036f6bb5865e3df5690089aa1eb04e8f616f9be522ef')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < ../$pkgname-$pkgver-audio.patch
  patch -Np1 < ../$pkgname-$pkgver-audio-ppc.patch
  patch -Np1 < ../$pkgname-$pkgver-format-security.patch
  patch -Np1 < ../$pkgname-$pkgver-gcc43.patch
  patch -Np1 < ../$pkgname-$pkgver-glutInit.patch
  patch -Np1 < ../$pkgname-$pkgver-rhbz1065649.patch
  patch -Np1 < ../$pkgname-$pkgver-sanitize.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure --enable-sound=yes --disable-binreloc --prefix=/usr --mandir=/usr/share/man
  make 
}
package(){  
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install

  cd data
  sed 's|Application;Games|Game;BlockGame|' -i crack-attack.desktop
  install -Dm644 crack-attack.desktop $pkgdir/usr/share/applications/crack-attack.desktop
  install -Dm644 crack-attack.xpm $pkgdir/usr/share/pixmaps/crack-attack.xpm
}
