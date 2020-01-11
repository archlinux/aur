# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: emersion <contact@emersion.fr>

_name=browserpass-native
pkgname=browserpass-git
pkgver=3.0.6.r27.c25e4ed
pkgrel=1
pkgdesc="Native host app for Browserpass, browser extension for zx2c4's pass (password manager) (Git checkout)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/${pkgname%-git}/${_name}"
license=('ISC')
depends=('gnupg')
makedepends=('go-pie' 'git')
optdepends=('browserpass-chromium: Chromium extension for Browserpass'
            'browserpass-firefox: Firefox extension for Browserpass')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/browserpass/${_name}.git)
sha256sums=('SKIP')
#validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')


pkgver() {
	cd "${_name}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "${_name}"
    make configure
}

build() {
    cd "${_name}"
    make "${pkgname%-git}"
}

check() {
    cd "${_name}"
    make test
}

package() {
    cd "${_name}"
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et:
