# Maintainer: Marcel Unbehaun <f.rostze.ux at gmail dot com>
pkgname=tumiki-fighters
pkgver=0.2
pkgrel=1
url="http://www.asahi-net.or.jp/~cs8k-cyu/windows/tf_e.html"
pkgdesc="sticky 2D shooter"
license=('custom')
depends=(libbulletml gcc-d sdl sdl_mixer)
arch=('x86_64')
source=(http://deb.debian.org/debian/pool/main/t/$pkgname/tumiki-fighters_$pkgver.dfsg1.orig.tar.gz
	http://http.debian.net/debian/pool/main/t/$pkgname/tumiki-fighters_$pkgver.dfsg1-9.debian.tar.xz)
md5sums=('3481eaae79df72c0950605c6348311fa'
         '45647180f8a4313f851926dec4f7c49f')

prepare() {
  cd "$srcdir"/tf
  for i in $(cat ../debian/patches/series); do
    patch -p1 <../debian/patches/$i
  done
}

build() {
  cd "$srcdir"/tf
  make
}

package() {
  cd "$srcdir"/tf
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm 755 ${pkgname} -t "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/games/$pkgname"

  find barrage -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;
  find enemy -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;
  find field -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;
  find sounds -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;
  find stage -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;
  find tumiki -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;

  install -Dm 644 "$srcdir/debian/$pkgname.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
  install -Dm 644 "$srcdir/debian/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
