# Maintainer: matsaa93 <matsaa93@gmail.com>
pkgname=ebsynth-cuda-git
_pkgname="ebsynth"
pkgver=r16.2f5c97c
pkgrel=1
pkgdesc="Example based image synthesizer with cuda beckend"
arch=('x86_64')
url="https://github.com/jamriska/${_pkgname}"
license=('unknown')
groups=()
depends=('cuda')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${_pkgname}")
conflicts=("ebsynth-git")
NVCCFLAGARCH=('-arch compute_50 -t 4')
NVCCFLAG="-DNDEBUG -D__CORRECT_ISO_CPP11_MATH_H_PROTO -O6 -std=c++11 -w -Xcompiler -fopenmp"
#replaces=()
# backup=()
#options=()
#install=
source=("${_pkgname}::git+https://github.com/jamriska/${_pkgname}"
        "LICENSE")
noextract=()
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "${_pkgname}"
	# cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    nvcc $NVCCFLAGARCH src/${_pkgname}.cpp src/${_pkgname}_cpu.cpp src/${_pkgname}_cuda.cu -I"include" $NVCCFLAG -o bin/$_pkgname
	#cd "$srcdir/${pkgname%-VCS}"
	#./autogen.sh
	#./configure --prefix=/usr
	#make
}


package() {
	cd "${_pkgname}"
    #install -dm644 "${pkgdir}/usr/share/${_pkgname}/examples"
    #install -dm644 "${pkgdir}/usr/share/${_pkgname}/doc"

    #install -DM644 "examples/*" "${pkgdir}/usr/share/${_pkgname}/examples/" 
    #install -DM644 "doc/*" "${pkgdir}/usr/share/${_pkgname}/doc/"
    cd "$srcdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "${_pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
