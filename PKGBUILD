# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=android-xml-converter
pkgname="$_pkgbase"
pkgver=11
pkgrel=1
pkgdesc="Android Binary XML (ABX) conversion tools"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/rhythmcache/android-xml-converter"
license=('Apache-2.0')
makedepends=('git' 'cargo')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/rhythmcache/android-xml-converter.git#tag=build-$pkgver")
sha256sums=('30c1f07800c93703546d5ef6363f183e9e448f0b9b5f07a2a6d9bd6a3d4d0abc')

prepare() {
	cd "$_pkgbase"
	meson setup build
}

build() {
	cd "$_pkgbase"
	meson compile -C build
}

package() {
	cd "$_pkgbase"
	install -Dm755 "build/abx2xml" "$pkgdir/usr/bin/abx2xml"
	install -Dm755 "build/xml2abx" "$pkgdir/usr/bin/xml2abx"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
