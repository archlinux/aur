# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Based on brother-dcpt500w by Samuel Fernando Mesa Giraldo
# https://github.com/FabioLolix

pkgname=brother-dcpt700w
pkgver=3.0.2
pkgrel=1
pkgdesc="Driver for the Brother DCP-T700W wifi multifuncional printer"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom:brother EULA')
depends=('cups')
depends_x86_64=('lib32-glibc')
optdepends=('brscan4')
install="${pkgname}.install"
source=('fix_lp.patch'
        'LICENSE'
        "http://download.brother.com/welcome/dlf101950/dcpt700wlpr-$pkgver-0.i386.rpm"
        "http://download.brother.com/welcome/dlf101951/dcpt700wcupswrapper-$pkgver-0.i386.rpm")
md5sums=('9cd6cc312202017e2273a227d7dfc2ff'
         '894d2fffe51badc93ebc0ac433317925'
         'bcd62b9be7bd1707cd243ac184f794b8'
         'dd4c03ea11be0b570cfe6be0b69c9625')

build() {
  cd "$srcdir"
  patch -Np0 < fix_lp.patch
}

package(){
  install -d $pkgdir/usr/bin
  install -d $pkgdir/var/spool/lpd
  install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpt700w "$pkgdir"/usr/bin/
  cp -R $srcdir/opt $pkgdir/opt
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
