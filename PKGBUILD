# Maintainer: oakszyjrnrdy <oakszyjrnrdy at outlook dot com>
_pkgname="dwm"
pkgname="$_pkgname-oakszyjrnrdy"
pkgver=6.2
pkgrel=2
pkgdesc="A dynamic window manager for X built by oakszyjrnrdy"
url="http://dwm.suckless.org"
arch=("x86_64")
license=("MIT")
options=("zipman")
depends=("libx11" "libxinerama" "libxft" "freetype2" "alacritty" "dmenu")
provides=("dwm")
conflicts=("dwm")
source=(
	"https://dl.suckless.org/dwm/$_pkgname-$pkgver.tar.gz"
	"dwm.desktop"
	"dwm-config-6.2.diff"
	"dwm-autostart-6.2.diff"
	"https://dwm.suckless.org/patches/hide_vacant_tags/dwm-hide_vacant_tags-6.2.diff"
	"https://dwm.suckless.org/patches/alpha/dwm-fixborders-6.2.diff"
	"https://dwm.suckless.org/patches/noborder/dwm-noborder-6.2.diff"
)
sha256sums=(
	"97902e2e007aaeaa3c6e3bed1f81785b817b7413947f1db1d3b62b8da4cd110e"
	"bc36426772e1471d6dd8c8aed91f288e16949e3463a9933fee6390ee0ccd3f81"
	"1175b8bf1852394d6c9e50825224eaaeaf234bbef6605c24c4941aaa3bd04248"
	"c978561abde2df339ef6bab73a1eaf9ad097db1038e46f6de0247b1aea35a5a2"
	"716d43cda73744abbe12c1ecd20fd55769c2a36730a57d0a12c09c06854b7fa8"
	"0343dccd71cb8a3f4a18637ea51f4764a51cda5d712092a103bac5cba7dfc7ad"
	"9bbf5f963e5a2d23ae4b8731f0c179a8615de5715a2dbf683fbe02115e24efe0"
)

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	patch --strip=1 --input=../dwm-config-6.2.diff
	patch --strip=1 --input=../dwm-autostart-6.2.diff
	patch --strip=1 --input=../dwm-hide_vacant_tags-6.2.diff
	patch --strip=1 --input=../dwm-fixborders-6.2.diff
	patch --strip=1 --input=../dwm-noborder-6.2.diff
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	make X11INC="/usr/include/X11" X11LIB="/usr/lib/X11"
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
	install -m644 -D "$srcdir/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}
