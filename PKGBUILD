# Maintainer: Steven De Bondt <egnappah at gmail dot com>

pkgbase=pluma-python3
_srcname=pluma
_tag=v1.24.0
pkgver=1.24.0
pkgrel=2
arch=('x86_64')
url="https://github.com/mate-desktop/pluma"
license=('GNU GENERAL PUBLIC LICENSE Version 2')
makedepends=('mate-common' 'yelp-tools' 'autoconf-archive')

# We all love colors. Stop pretending you don't.
BRED="\033[1;31m"
BYELLOW='\033[1;93m'
BORANGE='\033[01;38;5;214m'
BGREEN='\033[1;92m'
NOCOLOR='\033[0m'


source=("git+https://github.com/mate-desktop/pluma#tag=$_tag")
sha256sums=('SKIP')

pkgver() {
  echo $pkgver
}

prepare() {
	echo -e "${BYELLOW}Now ${BGREEN}checking and configuring${BYELLOW} via the autogen.${NOCOLOR}"
	sleep 1
	cd "${_srcname}"
	./autogen.sh
}

build() {
	echo -e "${BYELLOW}Now ${BGREEN}building${BYELLOW} pluma${NOCOLOR}"
	cd "${_srcname}"
	make
	sleep 2
	echo -e "${BYELLOW}Now ${BGREEN}preparing${BYELLOW} packaging parameters..${NOCOLOR}"
	mkdir ../build || echo -e "${BGREEN}OK: dir ready.${NOCOLOR}"
	sleep 1
	cd ../build
	export DESTDIR=$PWD
	cd "../${_srcname}"
	echo -e "${BYELLOW}Now ${BGREEN}writing out${BYELLOW} packaging files..${NOCOLOR}"
	sleep 1
	make install
}

package() {
	pkgdesc="Compiles the newest pluma that doesn't need python2"
	echo -e "${BYELLOW}Compiling new gschema..${NOCOLOR}"
	sleep 1
	glib-compile-schemas build/usr/local/share/glib-2.0/schemas
	echo -e "${BYELLOW}Packaging files..${NOCOLOR}"
	cp -vr build/* ../pkg/$pkgbase/
}

pkgname=("${pkgbase}")
