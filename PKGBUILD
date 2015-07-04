# Maintainer: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>

pkgname=cdparanoia-overread
pkgver=10.2
pkgrel=1
pkgdesc="Compact Disc Digital Audio extraction tool patched for lead-out overread support"
arch=('i686' 'x86_64')
url="http://www.xiph.org/paranoia/"
license=('GPL')
depends=('glibc')
options=('!makeflags')
conflicts=('cdparanoia')
provides=('cdparanoia')
source=("http://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-$pkgver.src.tgz"
        'gcc.patch'
	'overread.patch')
md5sums=('b304bbe8ab63373924a744eac9ebc652'
         '12da14958d2b84c6719fe69890436445'
         '6016c653227b895939c3757fea002972')

build() {
  cd "${srcdir}/cdparanoia-III-${pkgver}"
  patch -p0 -i ${srcdir}/gcc.patch
  patch -p1 -i ${srcdir}/overread.patch
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/cdparanoia-III-${pkgver}"
  make prefix="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" install
}
