#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=mtsieve
pkgver=2.4.4.r266
pkgrel=1
pkgdesc='Library for sieving various types of numbers'
url='https://sourceforge.net/projects/mtsieve/'
license=('GPL')
arch=('x86_64')
depends=('gmp' 'ocl-icd' 'opencl-driver')
source=("mtsieve-svn::svn+https://svn.code.sf.net/p/mtsieve/svn/")
sha256sums=('SKIP')

pkgver() {
         cd "$pkgname-svn"
	 local major="$(egrep -o "([0-9]{1,1}\.)+[0-9]{1,1}" -m 1 "CHANGES.txt")"
         local ver="$(svnversion)"
         printf "${major}.r%s" "${ver//[[:alpha:]]}"
}

prepare() {  
	cd "${srcdir}/${pkgname}-svn"
	sed \
		-e 's/^CPPFLAGS =/CPPFLAGS +=/' \
		-e "/^SVN_VERSION :=/s/=.*/= r${_pkgrev}/" \
		-i makefile
	sed '30 c\LD_FLAGS=-z noexecstack' -i makefile
	cd core
	sed '11 c\#include <cstddef>' -i MpArithVector.h
}

build() {
	cd "${srcdir}/${pkgname}-svn"
	CPPFLAGS+=' -march=native'
	LD_FLAGS+=' -z noexecstack'
	make

}

package() {
	  cd "${srcdir}/${pkgname}-svn"
	  install -Dm755 afsieve "${pkgdir}"/usr/bin/afsieve
	  install -Dm755 afsievecl "${pkgdir}"/usr/bin/afsievecl
	  install -Dm755 ccsieve "${pkgdir}"/usr/bin/ccsieve
	  install -Dm755 cksieve "${pkgdir}"/usr/bin/cksieve
	  install -Dm755 cksievecl "${pkgdir}"/usr/bin/cksievecl
	  install -Dm755 dmdsieve "${pkgdir}"/usr/bin/dmdsieve
	  install -Dm755 gcwsieve "${pkgdir}"/usr/bin/gcwsieve
	  install -Dm755 gcwsievecl "${pkgdir}"/usr/bin/gcwsievecl
	  install -Dm755 gfndsieve "${pkgdir}"/usr/bin/gfndsieve
	  install -Dm755 gfndsievecl "${pkgdir}"/usr/bin/gfndsievecl
	  install -Dm755 fbncsieve "${pkgdir}"/usr/bin/fbncsieve
	  install -Dm755 fkbnsieve "${pkgdir}"/usr/bin/fkbnsieve
	  install -Dm755 k1b2sieve "${pkgdir}"/usr/bin/k1b2sieve
	  install -Dm755 kbbsieve "${pkgdir}"/usr/bin/kbbsieve
	  install -Dm755 mfsieve "${pkgdir}"/usr/bin/mfsieve
	  install -Dm755 mfsievecl "${pkgdir}"/usr/bin/mfsievecl
	  install -Dm755 pixsieve "${pkgdir}"/usr/bin/pixsieve
	  install -Dm755 pixsievecl "${pkgdir}"/usr/bin/pixsievecl
	  install -Dm755 psieve "${pkgdir}"/usr/bin/psieve
	  install -Dm755 psievecl "${pkgdir}"/usr/bin/psievecl
	  install -Dm755 sgsieve "${pkgdir}"/usr/bin/sgsieve
	  install -Dm755 smsieve "${pkgdir}"/usr/bin/smsieve
	  install -Dm755 smsievecl "${pkgdir}"/usr/bin/smsievecl
	  install -Dm755 srsieve2 "${pkgdir}"/usr/bin/srsieve2
	  install -Dm755 srsieve2cl "${pkgdir}"/usr/bin/srsieve2cl
	  install -Dm755 twinsieve "${pkgdir}"/usr/bin/twinsieve
	  install -Dm755 xyyxsieve "${pkgdir}"/usr/bin/xyyxsieve
	  install -Dm755 xyyxsievecl "${pkgdir}"/usr/bin/xyyxsievecl
}
