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
sha1sums=('60d06c46a90cebaa17cc0152c1e18156aa43d05c'
          'e1bf8412d851830641e132d9a06db88c01990dec')
sha256sums=('66187e4b0774467c7316ed12ae168f928520ce4497ea16df0b799d98d8488156'
            'a0c6f01afac08144359e37e97db3cf66651dd01bcd3421fd58a01ff300d93e8e')
sha384sums=('c05d39cfb5b6654e5ff2c0afc509bcc7e8baa8e6f3075c527c28e1ab337375b01ca2ef180ae8f06007fed6f82de009e5'
            '3f1d02de7e5dbe6931c0ca85c2114f8ffa707b8efbed47aed192bd4c235a9273380bb430294e2f8d95a7326f3fcdfb4d')
sha512sums=('a1bcb38d81f8bf1d5be3da33a529641c476c1cf29848932cfad1bc40dbb84b7dc64c342b95ac625a2c8632543c21e71da7a0621597d5808a0a4e86495884df84'
            '1a6baddc688d6789ec2ece2ee197ac643608ec54d9a1a8236e3f2b089a55150cadd01cf35270ff73f12c022ecd501be9bb0842adc6a6da66b5c5da38cbc749e1')

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
