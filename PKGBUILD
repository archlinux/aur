# Maintainer: Jens Adam <jra@byte.cx>
# Maintainer of byacc: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: ecst <elecst 4t gmail d0t com>
# Contributor: Abel Stern <abel.stern AT gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=byacc-noconflict
_pkgname=byacc
pkgver=20150711
pkgrel=1
pkgdesc='Non-conflicting version of byacc not providing bison/yacc'
url='http://invisible-island.net/byacc/'
license=('custom')
arch=('i686' 'x86_64')
depends=('glibc')
source=(ftp://invisible-island.net/${_pkgname}/${_pkgname}-${pkgver}.tgz{,.asc})
md5sums=('2700401030583c4e9169ac7ea7d08de8' '04902ccc31acd497d0dc86cdb22f949d')
validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB')

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man --program-transform=s,^,b,
  make
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # License
  sed -n '/is distributed/,/distributed freely/p' README > COPYING
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
