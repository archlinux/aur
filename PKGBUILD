# Maintainer: 7k5x <7k5xlp0onfire@gmail.com>
# Contributor: Whemoon Jang <palindrom615@gmail.com>
# Contributor: Hodong Kim <nimfsoft@gmail.com>
# Contributor: Youngbin Han <sukso96100@gmail.com>
# Contributor: Changjoo Lee <icj7061@gmail.com>
# Contributor: ywen407 <ywen407@naver.com>

#The current git revision of nimf on GitHub uses a new function of libhangul that's not implemented in the current *release* version of it. Thus, we have to install libhangul-git. Install it from the AUR.
pkgname=nimf-git
pkgver=1.3.0.r9.799dfcd
pkgrel=1
pkgdesc="Nimf is a lightweight, fast and extensible input method framework."
arch=('any')
url="https://github.com/hamonikr/nimf"
license=('LGPL3')
depends=(gtk3
         'glib2'
         'libhangul-git'
         'libappindicator-gtk3'
         'libxkbcommon>=0.5.0'
         'libxklavier'
         'qt5-base'
         'wayland')
makedepends=(
    'git'
	'gcc'
	'intltool'
	'gtk-doc'
	'gtk2'
	'gtk-update-icon-cache'
	'librsvg'
	'libx11'
	'wayland-protocols'
)
provides=("nimf")
conflicts=("nimf")
source=( "nimf::git+${url}.git" )
md5sums=('SKIP' )

pkgver() {
	cd "$srcdir/nimf"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	rm -rf ../../nimf
}


build() {
	cd "$srcdir/nimf"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/nimf"
	make DESTDIR="${pkgdir}/" install
}
