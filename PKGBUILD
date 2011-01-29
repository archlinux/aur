# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=setcd
_basever=1.5
_extver=6
pkgver=${_basever}_${_extver}
pkgrel=2
pkgdesc="Control the behaviour of your cdrom device"
arch=('i686' 'x86_64')
url="http://packages.debian.org/squeeze/setcd"
license=('GPL')
depends=('glibc')
source=(
  "http://ftp.de.debian.org/debian/pool/main/s/${pkgname}/${pkgname}_${_basever}.orig.tar.gz"
  "http://ftp.de.debian.org/debian/pool/main/s/${pkgname}/${pkgname}_${_basever}-${_extver}.diff.gz"
)
md5sums=('60af6bc161aec0019be44c05a611c64f'
         'da9b4f89debac263b44cda1cb06e548b')

build() {
  cd "$srcdir"
  patch -p0 < ${pkgname}_${_basever}-${_extver}.diff

  cd "$srcdir/$pkgname-${_basever}"
  gcc -g -Wall ${pkgname}.c -o ${pkgname}
}

package() {
  cd "$srcdir/$pkgname-${_basever}"

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}

# vim:set ts=2 sw=2 et:
