# Package build for libhomegear-base from git (https://www.homegear.eu/index.php/Main_Page)
# Maintainer: Sven Klomp <mail at klomp dot eu>

pkgdesc='Base library for homegear home automation software'
_gitname=('libhomegear-base')
pkgname=('libhomegear-base-git')
pkgver=0.6.220.0d96d9e
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/Homegear/libhomegear-base"
makedepends=('gcc-libs' 'git' 'gnutls>=3.3.0' 'libgpg-error>=1.14' 'readline>=6.2' 'sqlite>=3.7.13' 'libxml2>=2.8.0' 'lzo>=2.0.6' 'wget')
depends=('gcc-libs')
conflicts=('libhomegear-base' 'homegear<0.6.0')
provides=('libhomegear-base')
source=("git+https://github.com/Homegear/libhomegear-base")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/${_gitname}
	echo "0.6.$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
	cd "${srcdir}/${_gitname}"
}

build() {
	cd "${srcdir}/${_gitname}"
	./bootstrap || exit 1
	./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --libdir=/usr/lib || exit 1
	make || exit 1
	strip -s src/.libs/libhomegear-base.so.1.0.0
}

package() {
	cd "${srcdir}/${_gitname}"
	make DESTDIR="${pkgdir}/" install
}
