# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=xqf
pkgver=1.0.6.2
pkgrel=2
pkgdesc="A game server browser and launcher for Unix/X11 for many popular games (a qstat frontend)"
url="https://xqf.github.io/"
arch=('i686' 'x86_64')
license=('GPL-2.0-only')
depends=('gtk2' 'qstat' 'geoip' 'gdk-pixbuf-xlib')
makedepends=('intltool')
conflicts=('xqf-cvs' 'xqf-svn' 'xqf-git')
source=("https://github.com/XQF/xqf/archive/xqf-${pkgver}.tar.gz" "autogen-gettext-version.patch")
b2sums=('36c135c064ae61af12daa70e9c78fe2a377ebcaf91b0f36fac43865b6b0601f104d8b09bd84b9d9699afdab7f3d4d3a0e67f3251f20d6ce025e92db2302d21a8'
        'c76b24b2693f31e55f745e3529eaf8cff14be08c25dca5ecb3118025fed1a7e2de2e4bc483bf05baaec1e11bfd68c519f5e60807cb70d6937f6f06e824ad3835')

build() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

    # Patch autogen.sh
    patch -p0 < "${srcdir}/autogen-gettext-version.patch"

    ./autogen.sh --prefix=/usr
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    # Remove empty directory
    rm -r "${pkgdir}/usr/libexec"
}

