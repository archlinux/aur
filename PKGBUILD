# Contributor: Campbell Barton <ideasman42@gmail.com>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=pax
pkgver=3.4
pkgrel=8
pkgdesc="The POSIX standard archive tool, supporting the two most common forms of standard Unix archive (backup) files - CPIO and TAR."
arch=("i686" "x86_64")
url="http://downloads.yoctoproject.org/mirror/sources"
license=("BSD")
depends=("glibc")
#makedepends=()
provides=("pax")
conflicts=("pax")
#replaces=()
#backup=()
#options=()
#install=
source=("http://downloads.yoctoproject.org/mirror/sources/$pkgname-$pkgver.tar.bz2"
	"001-pax-3.4_fix_for_compile_with_gcc-4.6.0.patch"
	"002-pax-3.4_fix_for_x32.patch"
	"003-pax-3.0_unuse_warn.patch"
	"004-pax-3.0_PATHMAX.patch"
	"005-pax-3.4_abs100.patch"
	"006-pax-3.4_rdtruncate.patch"
	"007-pax-3.4_fix_for_compile_with_gcc-6.1.patch"
	)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"


  patch -Np1 -i "${srcdir}/001-pax-3.4_fix_for_compile_with_gcc-4.6.0.patch"
  patch -Np1 -i "${srcdir}/002-pax-3.4_fix_for_x32.patch"
  patch -Np0 -i "${srcdir}/003-pax-3.0_unuse_warn.patch"
  patch -Np1 -i "${srcdir}/004-pax-3.0_PATHMAX.patch"
  patch -Np1 -i "${srcdir}/005-pax-3.4_abs100.patch"
  patch -Np1 -i "${srcdir}/006-pax-3.4_rdtruncate.patch"
  patch -p1 -i "${srcdir}/007-pax-3.4_fix_for_compile_with_gcc-6.1.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
  	--libdir=/usr/lib --libexecdir=/usr/lib \
  	--bindir=/usr/bin --sbindir=/usr/bin
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" libdir=/usr/lib libexecdir=/usr/lib \
          bindir=/usr/bin sbindir=/usr/bin install
  install -D -m644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
md5sums=('fbd9023b590b45ac3ade95870702a0d6'
         'fc4f9f3133b4be4c9e512b76209982c2'
         'b67b9ab3ace38b0c7aaa7cb47f4232de'
         '65c475b6d6461182591bd65704c0fb3c'
         '4a7cdc1d3f94f4d7d7e3b7637d3dd441'
         'f4cc0c8219c28290c45e559d93fea3ec'
         'ff6796fcecfecdc3a87a4e4762bcba19'
         '93fb100dab84000c164e7b6eb0b42937')
