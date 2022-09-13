<<<<<<< HEAD
# Maintainer: Viktor Danov <orangeleaf12@gmail.com>
pkgname=abacus-git
pkgver=1.4.0
pkgrel=1
epoch=
pkgdesc="A simple interactive calculator REPL with support for variables, lambdas, and more."
arch=('x86_64')
url="https://github.com/viktordanov/abacus.git"
license=('MIT')
groups=()
depends=()
makedepends=('go' 'git')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()
_gitroot="git@github.com:viktordanov/abacus.git"
_gitname="abacus"

build() {
    cd ${srcdir}/

    msg "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]]; then
        cd ${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot}
    fi
    
    msg "GIT checkout done."

    msg "Starting make for: ${pkgname}"
    
    if [[ -d ${srcdir}/${_gitname}-build ]]; then
       msg "Cleaning the previous build directory..." 
       rm -rf ${srcdir}/${_gitname}-build
    fi

    git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    
    cd ${srcdir}/${_gitname}-build
        
    make compile || return 1
}

package() {
    mkdir -p ${pkgdir}/usr/bin
    cp "${srcdir}/${_gitname}-build/build/abacus" "${pkgdir}/usr/bin"
    chmod +x "${pkgdir}/usr/bin/abacus"
=======
# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname="YoLang"
pkgver="1.2.15"
pkgrel=1
pkgdesc="Lightweight, simple interpretive programming language"
arch=("any")
url="https://github.com/PowerAngelXD/YoLang"
license=("MIT")
makedepends=("cmake"
            "make")
provides=("yolang")
source=("$pkgname-$pkgver.zip::https://github.com/PowerAngelXD/YoLang/archive/refs/heads/master.zip")
md5sums=("764407b9d4a7267dc857555a6a2fdaef")

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
	cd "$pkgname-master"
	cmake -S .
	make
}

package() {
	cd "$pkgname-master"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  install -m=777 "yolang" "${pkgdir}/usr/bin"
>>>>>>> d47039094e3cbb12d02741d4624cbf944de8f5f0
}
