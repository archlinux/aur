# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lyricue
pkgver=3.6.5
pkgrel=7
pkgdesc='GNU Lyric Display System, server and client'
epoch=
arch=('x86_64' 'armv6h')
url='https://www.lyricue.org'
license=('GPL')
depends=('clutter'
        'clutter-gtk'
        'clutter-gst'
        'mariadb'
        'mariadb-clients'
        'perl-dbi'
        'pango-perl'
        'gtk2-perl'
        'perl-uri'
        'perl-xml-simple'
        'gnome-perl'
        'perl-file-mimeinfo'
        'perl-dbd-mysql'
        'perl-class-accessor-lvalue'
        'perl-net-rendezvous-publish'
        'perl-want'
        'perl-locale-gettext'
        'perl-class-accessor'
        'perl-net-bonjour')
makedepends=('intltool'
        'pkg-config'
        'patch'
        'gcc'
        'make')
optdepends=('perl-gtk2-trayicon')
source=("http://www.lyricue.org/archive/${pkgname}_${pkgver}.tar.gz"
        'https://github.com/alerque/picue/raw/master/clutter-gst.patch'
        'https://github.com/alerque/picue/raw/master/gstreamer.patch')
sha256sums=('79049f49ecf9643c9c7a2cd7db90ee1d0e67499060604805c4ceb3fda5ef657d'
            '501b7e8647a937a2295873e50f1c4236aa4f390d0dd5630a411e92276a068166'
            'db584eb14c1fc82557f62397370381ce257eb71b20d5c07dc5b157bf8b3a9d74')

build() {
    cd "${pkgname}-${pkgver}"
    patch -Np0 -i "$srcdir/clutter-gst.patch"
    patch -Np0 -i "$srcdir/gstreamer.patch"
    ./configure --prefix=/usr
    make
}

check() {
    cd "${pkgname}-${pkgver}"
    make -k check
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
