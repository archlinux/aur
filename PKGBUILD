# Maintainer: Tony Lambiris <tony@libpcap.net>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=giblib
pkgver=1.2.4
pkgrel=9
pkgdesc="A library that feh uses as a wrapper to imlib2"
arch=('x86_64')
url="http://freshmeat.net/projects/giblib/"
license=('MIT')
depends=('imlib2' 'libxext' 'freetype2')
source=("https://downloads.sourceforge.net/project/slackbuildsdirectlinks/giblib/giblib-${pkgver}.tar.gz"
        "fix-configure_ac-imlib2.patch")
sha256sums=('176611c4d88d742ea4013991ad54c2f9d2feefbc97a28434c0f48922ebaa8bac'
        '982df1853b6c47bfdb73b27293e629a06e8b3b431084f20725d700eb8edbaf3c')

prepare() {
    cd "${pkgname}-${pkgver}"

    patch -Np1 -i "${srcdir}/fix-configure_ac-imlib2.patch"
}

build() {
    cd "${pkgname}-${pkgver}"

    autoreconf -ivf
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" docsdir=/usr/share/doc/giblib install

    # Install custom license
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
