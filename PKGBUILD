# Packager: Push Sla push2001sla@gmail.com
# Developer: andrewcrew@rambler.ru
pkgname=xneur-devel-git
pkgver=0.21.0
pkgrel=30
epoch=
pkgdesc="X Neural Switcher detects the input language and corrects keyboard layout. Git version"
arch=('x86_64')
url="https://github.com/AndrewCrewKuznetsov/xneur-devel"
license=('GPL')
groups=()
depends=('enchant1.6' 'gtk2' 'libnotify' 'gstreamer>=1.14.4')
makedepends=('git' 'intltool' 'cmake')
checkdepends=()
optdepends=('hunspell-ru' 'hunspell-en_US')
provides=("xneur=$pkgver" "xnconfig=$pkgver")
conflicts=('xneur')
replaces=('xneur')
backup=()
options=()
install=
changelog=
source=("git+http://github.com/AndrewCrewKuznetsov/xneur-devel.git")
noextract=()
md5sums=('SKIP')

validpgpkeys=()

prepare() {
    if test ! -h /usr/include/enchant; then
        echo "You have to check if enchant1.6 is installed"
        echo "And /usr/include/enchant is a symlink to /usr/include/enchant1.6"
        echo "ln -s /usr/include/enchant1.6 /usr/include/enchant"
	exit 127
    fi

}

build() {	
	cd "$srcdir/xneur-devel/xneur"
        #./autogen.sh --prefix=/usr/ --sysconfdir=/etc --without-xosd --with-gtk=gtk2
	#./configure --prefix=/usr/ --sysconfdir=/etc --without-xosd --with-gtk=gtk2
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr
	cmake --build build
}

package() {
	mkdir -p "$pkgdir/usr/bin"	

	cd "$srcdir/xneur-devel/xneur/build"
	make DESTDIR="$pkgdir/" install
}

