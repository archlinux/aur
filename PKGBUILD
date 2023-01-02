# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>
# Contributor: Julia <julia[at]insertdomain[dot]name>
# Contributor: Colin Reeder <colin[at]reederhome[dot]net>
# Contributor: Abraham Levine <arc[at]plusreed[dot]com>

pkgname=pa-applet-git
_pkgname="${pkgname%-git}"
pkgver=r19.3b4f8b3
pkgrel=6
pkgdesc="PulseAudio control applet"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/fernandotcl/pa-applet"
license=('BSD')
depends=('gtk3' 'libnotify' 'libpulse')
makedepends=('git')
options=('!libtool')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "${_pkgname}"
        CFLAGS+=" -Wno-error"
        ./autogen.sh
        ./configure --prefix=/usr
        make
}

package() {
        cd "${_pkgname}"

	make DESTDIR="${pkgdir}" install

        install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm 644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
}
