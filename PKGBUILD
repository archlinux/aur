# Maintainer: Dongsu Han <dongsu8142@naver.com>

pkgname=nimf-stable
pkgver=1.3.1
pkgrel=1
pkgdesc="Nimf is an multilingual input method framework."
arch=('any')
url="https://github.com/hamonikr/nimf"
license=('LGPL3')
makedepends=('binutils' 'autoconf' 'automake' 'gcc' 'make' 'glib2' 'intltool'
             'gtk3' 'gtk2' 'qt5-base' 'libappindicator-gtk3' 'libayatana-appindicator' 'librsvg'
             'noto-fonts-cjk' 'libhangul-git' 'anthy' 'librime' 'libxkbcommon'
             'wayland' 'wayland-protocols' 'libxklavier' 'm17n-lib' 'm17n-db' 'gtk-doc')
depends=('glib2' 'gtk3' 'gtk2' 'qt5-base' 'libappindicator-gtk3' 'libhangul-git'
         'anthy' 'librime' 'libxkbcommon' 'wayland' 'libxklavier' 'm17n-lib'
         'm17n-db')
provides=('nimf')
conflicts=('nimf')         
optdepends=(#'brise: Rime schema repository'
            'noto-fonts-cjk: Google Noto CJK fonts')
_archive="nimf-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=('SKIP')

build() {
	cd "$_archive"
	./autogen.sh --prefix=/usr --enable-gtk-doc
	make -j $(nproc)
}

package() {
	cd "$_archive"
	make DESTDIR="${pkgdir}/" install
}
