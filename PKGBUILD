# Maintainer: schw0reismus <schw0reismus@protonmail.com>

pkgname=foliate-git
_name=foliate
pkgver=171.7ac53bd
pkgrel=1
pkgdesc="A simple and modern GTK eBook reader"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://johnfactotum.github.io/foliate/"
license=('GPL-3.0')
depends=('gjs>=1.54.0'  'webkit2gtk' 'libsoup')
makedepends=('meson' 'ninja')
optdepends=('hyphen: Auto-hyphenation support'
						'hyphen-en: Hyphenation rules for English; you may choose package for your language')
source=("$_name::git+https://github.com/johnfactotum/$_name.git#branch=master")
provides=("$_name")
replaces=("$_name")
conflicts=("$_name")
md5sums=('SKIP')

build() {
	cd "$srcdir/$_name"
	meson build --prefix=/usr
	ninja -C build
}

package(){
	cd "$srcdir/$_name"
	DESTDIR="$pkgdir" ninja -C build install
}

pkgver() {
	cd "$srcdir/$_name"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
