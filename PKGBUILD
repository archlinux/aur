# Maintainer: Frederic Bezies < fredbezies at gmail dot com >

pkgname=quakespasm
pkgver=0.92.0
pkgrel=4
pkgdesc="A modern Quake 1 engine. Forked from Fitzquake. Stable version with Mission pack desktop files."
arch=('i686' 'x86_64')
url="http://quakespasm.sourceforge.net"
license=('GPL2')
depends=('libvorbis' 'libmad' 'sdl2')
conflicts=('quakespasm-svn')
install=$pkgname.install
source=(https://sourceforge.net/projects/quakespasm/files/Source/$pkgname-$pkgver.tgz
        $pkgname.desktop
        $pkgname-mp1.desktop
        $pkgname-mp2.desktop
        $pkgname-impel.desktop)
md5sums=('d7ba2b9eaca198f32f60eeabc1f02db1'
         '090c3c8f74dd649187bfe0ad7ac3cd76'
         '1d86f05cbe4254402e4c00a62f680e7f'
         'cdf7daadefaa1c44b1e3da574e5268d4'
         '96a70a5e74d56284149cc33019a9f8ad')

build() {
  cd "$srcdir/$pkgname-$pkgver/Quake/"
  msg "Starting make..."
  make DO_USERDIRS=1 USE_SDL2=1
}

package() {
  cd "$srcdir/$pkgname-$pkgver/Quake/"
  install -Dm755 quakespasm "$pkgdir"/usr/bin/$pkgname
  
  for i in 16 24 32 48 64 72; do
    install -Dm644 $srcdir/$pkgname-$pkgver/Misc/QuakeSpasm_512.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/quakespasm.png
  done

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $srcdir/$pkgname-mp1.desktop $pkgdir/usr/share/applications/$pkgname-mp1.desktop
  install -Dm644 $srcdir/$pkgname-mp2.desktop $pkgdir/usr/share/applications/$pkgname-mp2.desktop
  install -Dm644 $srcdir/$pkgname-impel.desktop $pkgdir/usr/share/applications/$pkgname-impel.desktop
}
