# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>
# Contributor: Lin Rs <lin dot ruohshoei+arch at gmail dot com>
# Contributor: Randy Ramos <rramos1295@gmail.com>
# Contributor: Reventlov <contact+aur@volcanis.me>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Zariel <c.bannister@gmail.com>
# Contributor: Gabriel M. Dutra <0xdutra@gmail.com>

pkgname=irssi-git
pkgver=1.5+1.dev.r50.g55913ade
pkgrel=1
pkgdesc="Modular text mode IRC client with Perl scripting"
arch=('i686' 'x86_64')
url="https://irssi.org/"
license=('GPL')
depends=('glib2' 'openssl' 'perl' 'libotr' 'ncurses' 'libutf8proc')
makedepends=('git' 'meson' 'ninja')
optdepends=('perl-libwww: For the scriptassist script')
conflicts=('irssi')
provides=('irssi')
backup=('etc/irssi.conf')
source=("git+https://github.com/irssi/irssi.git")
b2sums=('SKIP')

pkgver() {
	cd irssi
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	meson --prefix=/usr --buildtype=plain irssi build \
		-Dwith-proxy=yes \
		-Dwith-perl-lib=vendor \
		-Dwith-perl=yes \
		-Dwith-otr=yes
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm 644 irssi/irssi.conf "${pkgdir}"/etc/irssi.conf
}
