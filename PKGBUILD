# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>

pkgname=audacious-usf-plugin-git
pkgver=r10.abd9ddf
pkgrel=2
pkgdesc="The USF plugin (N64) for audacious"
arch=(x86_64)
url="https://github.com/saschaklick/audacious-usf-plugin"
license=('unknown')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/saschaklick/audacious-usf-plugin')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install

    # remove locale .mo files conflicting with extra/audacious-plugins
    rm -r "$pkgdir/usr/share/locale"
}
