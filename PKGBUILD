# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake-par
pkgver=0.03.01
pkgrel=2
pkgdesc="Quake PAK archiving utility."
url="http://ftp.vim.org/ibiblio/games/quake/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('glibc')
source=("http://ftp.vim.org/ibiblio/games/quake/par-${pkgver}.tar.gz")
sha256sums=('e68a3b78586cd762b29f5d5edca8ea9f263fa100423f4d4fee36c7e0a5061122')

build() {
    cd "${srcdir}/par-${pkgver}"
    ./configure
    make
}

package() {
    cd "${srcdir}/par-${pkgver}"

    # Modify Prefix Directory in Makefile
    /bin/sed -i "s:/usr/local:${pkgdir}/usr:" Makefile.Linux

    # Modify man page Directory in Makefile
    /bin/sed -i "s:\${prefix}/man:${pkgdir}/usr/share/man:" Makefile.Linux

    # Create Destination Directories
    install -d "${pkgdir}"/usr/{bin,share/man/man1}

    make install
}
