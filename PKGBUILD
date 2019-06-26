# Maintainer: Simon Tas <simon.tas.st@gmail.com>
pkgname="sam-rewritten-git"
_pkgname="SamRewritten"
pkgver=r36.f332129
pkgrel=1
pkgdesc="Steam Achievement Manager For Linux. Rewritten in C++."
arch=('any')
url="https://github.com/PaulCombal/SamRewritten"
license=('GPL3')
depends=('steam' 'yajl' 'gtk3' 'glibc')
makedepends=('git')
source=("git+https://github.com/PaulCombal/SamRewritten.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/$_pkgname"
	./make.sh
	
	#removing compiled c++ code
	rm -rf SAM.Picker
	rm -rf common
}

package() {
    cd "${srcdir}/$_pkgname"
    
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
    cp -dr --no-preserve=ownership ./* "${pkgdir}/usr/lib/${_pkgname}/"
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/bin/launch.sh" "${pkgdir}/usr/bin/${pkgname}"
}
 
