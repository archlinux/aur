# Packager: push_sla <push2001sla@gmail.com>
# Developer: andrewcrew@rambler.ru

pkgname=gxneur-devel-git
pkgver=0.21.0
pkgrel=30
epoch=
pkgdesc="XNeur GTK frontend. Git version"
arch=('any')
url="https://github.com/AndrewCrewKuznetsov/xneur-devel"
license=('GPL')
groups=()
depends=('libglade' "xneur-devel-git=$pkgver" 'gconf' 'xorg-xprop' '')
makedepends=('git')
checkdepends=()
optdepends=()
provides=("gxneur=$pkgver")
conflicts=('gxneur')
replaces=('gxneur')
backup=()
options=()
install=
changelog=
source=("git+https://github.com/AndrewCrewKuznetsov/xneur-devel.git")
noextract=()
md5sums=('SKIP')

build() {
    cd "$srcdir/xneur-devel/gxneur"
    #./autogen.sh --prefix=/usr
    #sed -i 's/TODO//' Makefile
    touch README
    ./autogen.sh --prefix=/usr --with-gtk=gtk2 --without-xosd
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
	mkdir -p "$pkgdir/usr/bin"	

	cd "$srcdir/xneur-devel/gxneur/build"
	make DESTDIR="$pkgdir/" install
	
}

