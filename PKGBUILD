# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
pkgname=pspp
pkgver=0.8.5
pkgrel=1
pkgdesc="Statistical analysis program. Free replacement for SPSS."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/pspp/"
license=('GPL3')
depends=('gsl' 'gtksourceview2' 'postgresql-libs' 'desktop-file-utils')
optdepends=('zlib: GNUmeric support'
            'libxml2: GNUMERIC support')
options=('!libtool' '!emptydirs')
source=(ftp://ftp.gnu.org/gnu/pspp/pspp-${pkgver}.tar.gz)
md5sums=('7600234a8a968c513a2e5c5dbecfc392')
install=pspp.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --without-libreadline-prefix
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}/usr/share/info/dir"
    install -d "${pkgdir}"/usr/share/pspp/contrib
    install -m 644 pspp-mode.el "${pkgdir}"/usr/share/pspp/contrib/pspp-mode.el
}

# End of file
