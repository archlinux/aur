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
b2sums=('7e257374768d24194484aca0a726ca8abb0ac2a2726a945d350bce06d08175b0479fd496647867a5b6c1c716be809eb8447693b95b5d0757a8a190632b4a2a42')

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
