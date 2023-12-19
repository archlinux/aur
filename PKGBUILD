# Maintainer: Trenzalore

_major=73
_gitname=icu
_pkgname=$_gitname$_major
pkgname="$_pkgname-bin"
pkgver="$_major.2"
pkgrel=1
pkgdesc="International Components for Unicode library (version 73)"
arch=('x86_64')
url="https://github.com/unicode-org/icu"
license=('custom:icu')
depends=('gcc-libs' 'sh')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/release-${pkgver/./-}/icu4c-${pkgver/./_}-Fedora_Linux37-x64.tgz")
b2sums=('9a5e257bb5558bf55d086e4308bc15e7e9cad8d47d9d67e6cac32f6f5164cf965d53d32002b8958076ef75607506be6c3e2844d6541d66d9021bf3d7ad84a9f3')

_src_libdir=icu/usr/local/lib

prepare() {
	# prevent conflicts with other versions of icu
	rm -rf $_src_libdir/{icu,pkgconfig}
	_solist=('data' 'i18n' 'io' 'test' 'tu' 'uc')
	for _i in ${_solist[@]}; do
		rm $_src_libdir/libicu$_i.so
	done
}

package() {
	cd $_src_libdir
	install -Dm644 * -t "$pkgdir/usr/lib/"
	install -Dm644 ../share/$_gitname/$pkgver/LICENSE \
		-t "$pkgdir/usr/share/licenses/$pkgname"
}
