# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Claire Charron <claire@undeterminant.net>
_pkgname=noto-fonts-emoji
pkgname=$_pkgname-git
pkgver=2.028.r0.gc05b4b47c
pkgrel=1
epoch=2
pkgdesc="Google Noto emoji fonts"
arch=('any')
url="https://github.com/googlefonts/noto-emoji"
license=('Apache')
makedepends=('cairo' 'git' 'imagemagick' 'pngquant' 'python-nototools' 'zopfli')
provides=("$_pkgname" 'emoji-font')
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	make -C $_pkgname clean
}

build() {
	make -C $_pkgname BYPASS_SEQUENCE_CHECK=1 VIRTUAL_ENV=1
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/share/fonts/noto $_pkgname/NotoColorEmoji.ttf
}
