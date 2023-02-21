# Maintainer: BrainwreckedTech <bwt@bwt.com.de>
# Geekbench 5 Maintainer: Jake <aur@ja-ke.tech>
# Original GB5 Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>

pkgname=geekbench5
_pkgname=geekbench
pkgver=5.5.1
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('i686' 'pentium4' 'x86_64')
url="http://www.primatelabs.ca/geekbench/"
depends=('zlib' 'gcc-libs')
license=("custom")
source=("https://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
sha512sums=('0fd90d55eaaf178e4c981ef6ef54808d1ff86edc92c907a5d8e2a3a379c2289e614d917db330a3d748c818bcedb2dc69cad250b1b98ba80287c6d9a66382bcc4')
options=('!strip')

package() {
mkdir -p $pkgdir/usr/bin
case ${CARCH} in
  x86_64)
     install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${pkgname} $pkgdir/opt/${pkgname}/${pkgname}
     install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${_pkgname}_x86_64 $pkgdir/opt/${pkgname}/${_pkgname}_x86_64
     ln -s /opt/${pkgname}/${pkgname} $pkgdir/usr/bin/${pkgname};;
  i686|pentium4)
     install -D -m755 $srcdir/Geekbench-${pkgver}-Linux/${_pkgname}_x86_32 $pkgdir/opt/${pkgname}/${_pkgname}_x86_32
     ln -s /opt/${pkgname}/${_pkgname}_x86_32 $pkgdir/opt/${pkgname}/${pkgname}
     ln -s /opt/${pkgname}/${pkgname} $pkgdir/usr/bin/${pkgname};;
esac
install -D -m644 $srcdir/Geekbench-${pkgver}-Linux/${_pkgname}.plar $pkgdir/opt/${pkgname}/${_pkgname}.plar
}
