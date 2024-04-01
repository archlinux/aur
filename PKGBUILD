# Maintainer: Charles Dong <charlesdong_2000@outlook.com>
pkgname=xz-5.4
pkgver=5.4.6
pkgrel=3
pkgdesc="xz 5.4.x"
arch=("x86_64")
url="https://xz.tukaani.org/xz-utils/"
license=('GPL' 'LGPL' 'custom')
depends=("sh")
makedepends=("git" "po4a" "doxygen")
checkdepends=()
optdepends=()
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620') # Lasse Collin <lasse.collin@tukaani.org>
														  # NOTE: Make sure no Jia Tan
provides=("xz" "liblzma.so=5-64")
conflicts=("xz")
replaces=()
backup=()
options=()
install=
changelog=

_pkgname=xz

source=("git+https://git.tukaani.org/xz.git#tag=v${pkgver}")
sha256sums=('562a7ab5be6c72ff9486671dfc6ca1e9ca6668e60c943350103bc8b509319514')
sha512sums=('ca38849ce7168c0773223fd6d44cceea73804f639753d2ee871138ce46c7325ced516207d3de4998b7e9174bcfb3b1bc6a02bc208f0bd71530cf80af27322702')

prepare() {
	mv ./$_pkgname $srcdir/$_pkgname-$pkgver
	cd $srcdir/$_pkgname-$pkgver
	./autogen.sh
}

build() {
	cd "$_pkgname-$pkgver"
	
	./configure \
		--prefix=/usr \
		--disable-rpath \
		--enable-werror

	make
}

check() {
	cd "$_pkgname-$pkgver"
	make check
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	install -d -m0755 "${pkgdir}/usr/share/licenses/xz/"
	ln -sf /usr/share/doc/xz/COPYING "${pkgdir}/usr/share/licenses/xz/"
}
