# Maintainer: éclairevoyant
# Contributor: syntheit <daniel at matv dot io>

_major=71
_gitname=icu
_pkgname=$_gitname$_major
pkgname="$_pkgname-bin"
pkgver="$_major.1"
pkgrel=2
pkgdesc="International Components for Unicode library"
arch=('x86_64')
url="https://github.com/unicode-org/icu"
license=('custom:icu')
depends=('gcc-libs' 'sh')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/release-${pkgver/./-}/icu4c-${pkgver/./_}-Fedora32-x64.tgz")
b2sums=('06521e0193d1cdae93fc8aa1097be8cb4f61dac33bae0839490ba6a4ff8d455a3c12f6210b967d8f1bf8930090cc05d4eeafda6427179e3367fff532b8dd17a0')

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
