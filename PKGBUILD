#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=mtsieve
_pkgrev=85
_srcrev=r${_pkgrev}-trunk
pkgver=2.1.3r${_pkgrev}
_pkgver=2.1.3
pkgrel=2
pkgdesc='Library for sieving various types of numbers'
url='https://sourceforge.net/projects/mtsieve/'
license=('GPL')
arch=('x86_64')
depends=('gmp' 'ocl-icd' 'opencl-driver')

# Static copy of the snapshot file since sourceforge regenerates it on demand.
source=("https://github.com/Dylan1496/mtsieve-source/raw/main/mtsieve-${_pkgver}-${_srcrev}.zip")
sha256sums=('c3ec778ebd618c941bc2fa6479e16133c47d3fc41b44475acbdf1115313e9d35')

prepare() {  
	cd "${srcdir}/${pkgname}-svn"
	sed \
		-e 's/^CPPFLAGS =/CPPFLAGS +=/' \
		-e "/^SVN_VERSION :=/s/=.*/= r${_pkgrev}/" \
		-i makefile
}

build() {
	cd "${srcdir}/${pkgname}-svn"
	CPPFLAGS+=' -march=native'
	make

}

package() {
	  cd "${srcdir}/${pkgname}-svn"
	  install -Dm755 afsieve "${pkgdir}"/usr/bin/afsieve
	  install -Dm755 afsievecl "${pkgdir}"/usr/bin/afsievecl
	  install -Dm755 cksieve "${pkgdir}"/usr/bin/cksieve
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
	  install -Dm755 sgsieve "${pkgdir}"/usr/bin/sgsieve
	  install -Dm755 srsieve2 "${pkgdir}"/usr/bin/srsieve2
	  install -Dm755 twinsieve "${pkgdir}"/usr/bin/twinsieve
	  install -Dm755 xyyxsieve "${pkgdir}"/usr/bin/xyyxsieve
	  install -Dm755 xyyxsievecl "${pkgdir}"/usr/bin/xyyxsievecl
}