# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Mateusz Lukasik <mati75@linuxmint.pl>

pkgname=tinywm
pkgver=1.3
pkgrel=10
pkgdesc="A tiny window manager written in only ~50 lines of code"
arch=('i686' 'x86_64')
url="http://incise.org/tinywm.html"
license=('custom')
depends=('libx11')
source=(http://incise.org/files/dev/$pkgname-$pkgver.tgz
'add_install_taget.patch'
'fix_ftbfs_ld_as_needed.patch'
'tinywm.desktop')
md5sums=('8b1c1c3a0615af122b6f9f16ead6a34e'
         '5e27fe3b6fdde27b52805bd65febdff9'
         '90d4babe618fced0591edc2fe36eb123'
         '1c8c4ff10c7c9af52e0c6d1eb14cf523')

build() {
  cd $pkgname-$pkgver
  patch -Np1 -i "$srcdir/add_install_taget.patch"
  patch -Np1 -i "$srcdir/fix_ftbfs_ld_as_needed.patch"
  make
}

package() {
  cd $pkgname-$pkgver
  install -D -m755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -D -Dm644 $srcdir/$pkgname.desktop "$pkgdir"/usr/share/xsessions/$pkgname.desktop
}
