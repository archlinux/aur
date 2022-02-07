# Maintainer: BrainwreckedTech <bwt@bwt.com.de>
# Geekbench 5 Maintainer: Jake <aur@ja-ke.tech>
# Original GB5 Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: Roman Ajsin <aysin (dot) roman [at] gmail (dot) com>

pkgname=geekbench4
_pkgname=geekbench
pkgver=4.4.4
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance"
arch=('i686' 'pentium4' 'x86_64')
url="http://www.primatelabs.ca/geekbench/"
depends=('zlib' 'gcc-libs')
license=("custom")
source=("https://cdn.geekbench.com/Geekbench-${pkgver}-Linux.tar.gz")
sha512sums=('c43e1d658d361347efb012824ff0b81975ace35c866a1c2a227adeb86167292b639f19e8fe190d2f0de395f19280a99cb20342325177222f634c9e71c9226e78')
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
