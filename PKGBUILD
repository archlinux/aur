# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

_pkgname=rowhammer-test
_githubuser='google'
_github="git://github.com/${_githubuser}/${_pkgname}.git"
pkgname=${_pkgname}-git
pkgver=0.1.r27.gb60f2ce
pkgrel=1
pkgdesc="A programm to detect a machine's vulnerability to the 'rowhammer' attack"
arch=('i686' 'x86_64')
url="https://github.com/${_githubuser}/${_pkgname}"
license=('apache')
depends=('gcc-libs')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+${_github}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	(git describe --long 2>/dev/null) || (echo 0.1-$(git log --pretty=oneline|wc -l)-g$(git describe --always))| sed 's|\([^-]*-g\)|r\1|;s|-|.|g'
}

build() {
	cd "${srcdir}/${_pkgname}"

        ./make.sh
}

package() {
        cd "${srcdir}/${_pkgname}"
        
        install -m 755 -d ${pkgdir}/usr/bin
        install -m 755 rowhammer_test "${pkgdir}/usr/bin/rowhammer-test"
	install -m 755 double_sided_rowhammer "${pkgdir}/usr/bin/double-sided-rowhammer"
}
