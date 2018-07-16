# Maintainer: Hodong Kim <cogniti@gmail.com>

pkgname=nimf-git
pkgver=master
pkgrel=1
pkgdesc="Nimf is an input method framework."
arch=('any')
url="https://gitlab.com/nimf-i18n/nimf"
license=('LGPL3')
makedepends=('binutils' 'autoconf' 'automake' 'gcc' 'make' 'glib2' 'intltool'
             'gtk3' 'gtk2' 'qt4' 'qt5-base' 'libappindicator-gtk3' 'librsvg'
             'noto-fonts-cjk' 'libhangul' 'anthy' 'libchewing' 'librime'
             'libxkbcommon' 'wayland' 'audit')
depends=('glib2' 'gtk3' 'gtk2' 'qt4' 'qt5-base' 'libappindicator-gtk3'
         'libhangul' 'anthy' 'libchewing' 'librime' 'libxkbcommon' 'wayland'
         'audit')
optdepends=('brise: Rime schema repository'
            'noto-fonts-cjk: Google Noto CJK fonts'
            'xorg-setxkbmap: Set the keyboard using the X Keyboard Extension')
source=("https://gitlab.com/nimf-i18n/nimf/-/archive/master/nimf-master.tar.bz2")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/nimf-master"
	grep AC_INIT configure.ac | grep -Po '\d{4}.\d{2}.\d{2}'
}

build() {
	cd "$srcdir/nimf-master"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/nimf-master"
	make DESTDIR="${pkgdir}/" install
}
