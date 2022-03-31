# Maintainer: Atomisirsi <atomisirsi@gsklan.de>
# Maintainer: farwayer <farwayer@gmail.com>
# Submitter: Francisco Demartino <demartino.francisco@gmail.com>

_pkgname=telegram-purple
pkgname=${_pkgname}-git
pkgver=1.4.7.r2.g5a98a34
pkgrel=1
pkgdesc="Adds support for Telegram to Pidgin, Adium, Finch and other Libpurple based messengers."
arch=('any')
url="https://github.com/majn/telegram-purple"
license=("GPL")
makedepends=("git")
depends=('glib2' 'libgcrypt>=1.6.0' 'libpurple' 'zlib' 'libwebp')
conflicts=('telegram-purple')
provides=('telegram-purple')

source=("git+https://github.com/majn/telegram-purple#branch=master")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule update --init --recursive
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}/" install
	rmdir -p --ignore-fail-on-non-empty "${pkgdir}/etc/${_pkgname}"
}
