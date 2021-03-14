# Maintainer: Marcel Unbehaun <f.rostze.ux at gmail dot com>
pkgname=mu-cade
pkgver=0.11
pkgrel=2
url="http://www.asahi-net.or.jp/~cs8k-cyu/windows/mcd_e.html"
pkgdesc="abstract shoot-em-up game, similar to Geometry Wars"
license=('custom')
depends=(libbulletml gcc-d ode sdl sdl_mixer)
arch=('x86_64')
source=(http://deb.debian.org/debian/pool/main/m/$pkgname/mu-cade_$pkgver.dfsg1.orig.tar.gz
    http://deb.debian.org/debian/pool/main/m/$pkgname/mu-cade_$pkgver.dfsg1-12.debian.tar.xz)
md5sums=('d1b42a66ef20bf357abbedcdd91566dd'
         'ec35e9fff1fd21c2dcd033165c985e25')

prepare() {
  cd "$srcdir"/mcd
  for i in $(cat ../debian/patches/series); do
    patch -p1 <../debian/patches/$i
  done
}

build() {
  cd "$srcdir"/mcd
  make
}

package() {
  cd "$srcdir"/mcd
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm 755 ${pkgname} -t "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/games/$pkgname"

  find barrage -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;
  find images -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;
  find sounds -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;

  install -Dm 644 "$srcdir/debian/$pkgname.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
  install -Dm 644 "$srcdir/debian/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

}
