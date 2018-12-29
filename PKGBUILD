# Maintainer: Aniket-Pradhan aniket17133@iiitd.ac.in
# Contributer: Peter Hofmann <insert_email_here>

pkgname=birtty
pkgver=18.06
pkgrel=2
pkgdesc="Try not to crash that bird"
url="https://www.uninformativ.de/git/birtty"
license=("custom:PIZZA-WARE LICENSE")
makedepends=("gcc" "make")
conflicts=("birtty-git")
arch=("i686" "x86_64")
_gitroot="https://www.uninformativ.de/git/birtty.git"
_gitname="getstream"

build() {

	echo "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin
        echo "The local files are updated..."
    else
        git clone ${_gitroot} ${_gitname}
    fi

    echo "GIT checkout done."

    echo "Starting make for: ${pkgname}"

    if [[ -d ${srcdir}/${_gitname}-build ]]; then
       echo "Cleaning the previous build directory..." 
       rm -rf ${srcdir}/${_gitname}-build
    fi

    git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    
    cd ${srcdir}/${_gitname}-build
        
    echo "Starting configure..."

 	make
}

package() {
	cd ${srcdir}/${_gitname}-build
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
