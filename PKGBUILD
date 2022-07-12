# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>
# Contributor: Julia <julia[at]insertdomain[dot]name>
# Contributor: Colin Reeder <colin[at]reederhome[at]net>
# Contributor: Abraham Levine <arc[at]plusreed[dot]com>

pkgname=pa-applet-git
pkgver=19.3b4f8b3
pkgrel=3
pkgdesc="PulseAudio control applet"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/fernandotcl/pa-applet"
license=('BSD')
depends=('gtk3' 'libnotify' 'libpulse')
makedepends=('git')
options=('!libtool')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
            cd "${pkgname}"
                echo "$(git rev-list --count HEAD)"."$(git rev-parse --short HEAD)"
}

build() {
        cd "${srcdir}/${pkgname}"
        CFLAGS+=" -Wno-error"
        ./autogen.sh
        ./configure --prefix=/usr
        make
}

package() {
        cd "${srcdir}/${pkgname}"
        make DESTDIR="${pkgdir}" install
        install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
