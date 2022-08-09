# Maintainer: Marcel Unbehaun <f.rostze.ux at gmail dot com>
pkgname=titanion
pkgver=0.3
pkgrel=2
url="http://www.asahi-net.or.jp/~cs8k-cyu/windows/ttn_e.html"
pkgdesc=" Strike down super high-velocity swooping insects."
license=('custom')
depends=(libbulletml gcc-d sdl sdl_mixer)
arch=('x86_64')
source=(http://deb.debian.org/debian/pool/main/t/$pkgname/titanion_$pkgver.dfsg1.orig.tar.gz
    http://ftp.debian.org/debian/pool/main/t/$pkgname/titanion_$pkgver.dfsg1-8.debian.tar.xz)
md5sums=('cb173a81a66f7a214db58f1e7507aea1'
         '84fc0311eb79ee2c8aff76ed336866c5')

prepare() {
  cd "$srcdir"/ttn
  for i in $(cat ../debian/patches/series); do
    patch -p1 <../debian/patches/$i
  done
}

build() {
  cd "$srcdir"/ttn
  make
}

package() {
  cd "$srcdir"/ttn
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm 755 ${pkgname} -t "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/games/$pkgname"

  find images -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;
  find sounds -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;

  install -Dm 644 "$srcdir/debian/$pkgname.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
  install -Dm 644 "$srcdir/debian/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
