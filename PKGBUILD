# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor:  M. Jarvis
_pkgname=deswl-shapelets
pkgname=${_pkgname}-git
pkgver=r591.61b4606
pkgrel=1
#epoch=
pkgdesc="DES WL pipeline code for measuring PSF and shear with shapelets  "
arch=('i686' 'x86_64')
url="https://github.com/rmjarvis/deswl_shapelets"
license=('GPL')
depends=('atlas-lapack' 'tmv-git' 'ccfits')
makedepends=('git' 'atlas-lapack' 'tmv-git' 'ccfits') 
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd "${_pkgname}"
	 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
	cd "${_pkgname}"
	#sed -i "s_'-O2'_'-O2' '-std=c++98'_" SConstruct
	sed -i "132i \\\t    env.Append(CXXFLAGS = '-std=c++98') " SConstruct
}

build() {
	cd "${_pkgname}"
	scons PREFIX=/usr TMV_DIR=/usr 
}


package() {
	  cd "${_pkgname}"	
	  scons PREFIX=$pkgdir/usr install
}
