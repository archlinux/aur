# Maintainer: Marcel Unbehaun <f.rostze.ux at gmail dot com>
pkgname=a7xpg
pkgver=0.11
pkgrel=1
url="http://www.asahi-net.or.jp/~cs8k-cyu/windows/a7xpg_e.html"
pkgdesc="Old school chase action game 'A7Xpg'"
license=('custom')
depends=(libbulletml gcc-d sdl sdl_mixer)
arch=('x86_64')
source=(http://ftp.debian.org/debian/pool/main/a/a7xpg/a7xpg_$pkgver.dfsg1.orig.tar.gz
    http://ftp.debian.org/debian/pool/main/a/a7xpg/a7xpg_$pkgver.dfsg1-10.debian.tar.xz)
md5sums=('b6c5d00863220d3a833cfbc97e3f7e24'
         '21a2cd76a70d99a48fd9bf81b0aff5c7')

prepare() {
  cd "$srcdir"/a7xpg
  for i in $(cat ../debian/patches/series); do
    patch -p1 <../debian/patches/$i
  done
}

build() {
  cd "$srcdir"/a7xpg
  make
}

package() {
  cd "$srcdir"/a7xpg
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm 755 ${pkgname} -t "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/games/$pkgname"

  find images -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;
  find sounds -type f -exec install -D -m 644 {,"${pkgdir}/usr/share/games/$pkgname/"}{} \;

  install -Dm 644 "$srcdir/debian/$pkgname.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
  install -Dm 644 "$srcdir/debian/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
