# Maintainer: Marcel Unbehaun <f.rostze.ux at gmail dot com>
pkgname=gunroar
pkgver=0.15
pkgrel=1
url="http://www.asahi-net.or.jp/~cs8k-cyu/windows/gr_e.html"
pkgdesc="360-degree gunboat shooter"
license=('custom')
depends=(libbulletml gcc-d sdl sdl_mixer)
arch=('x86_64')
source=(http://ftp.debian.org/debian/pool/main/g/gunroar/gunroar_$pkgver.dfsg1.orig.tar.gz
    http://ftp.debian.org/debian/pool/main/g/gunroar/gunroar_$pkgver.dfsg1-9.debian.tar.xz)
md5sums=('a2a5637f590fcc9369646fcb4a91bd1d'
         '4c6c147fd8f32e69703a1578ad9d461c')

prepare() {
  cd "$srcdir"/gr
  for i in $(cat ../debian/patches/series); do
    patch -p1 <../debian/patches/$i
  done
}

build() {
  cd "$srcdir"/gr
  make
}

package() {
  cd "$srcdir"/gr
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm 755 ${pkgname} -t "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/games/$pkgname"

  find images -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;
  find sounds -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;

  install -Dm 644 "$srcdir/debian/$pkgname.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
  install -Dm 644 "$srcdir/debian/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
