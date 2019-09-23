# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Marcos Heredia <chelqo@gmail.com>
# Contributor: yury <polek_yury@ukr.net>
# Contributor: Carlos Maddela <e7appew@gmail.com> (Ubuntu)
# Contributor: Carlo Bertelli <carlo.bertelli@gmail.com>
# Contributor: Albert Gräf <aggraef@gmail.com>

pkgname=pdfchain
pkgver=0.4.4.2
pkgrel=5
pkgdesc='A graphical user interface for the PDF toolkit'
arch=('x86_64')
url='http://pdfchain.sourceforge.net/'
license=('GPL3')
depends=(
    # official repositories:
        'gcc-libs' 'gtkmm3'
    # AUR:
        'pdftk'
)
options=('!emptydirs')
source=("https://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'pdfchain-fix-crash-on-startup.patch'
        'pdfchain-fix-desktop-file.patch'
        'pdfchain-fix-spelling.patch')
sha256sums=('1eee0f93dbe8c9cef9f9fe4ec0a10e0a45ca8cde67cd6ceffa2ce6c843752f3d'
            'fa46f0fefc1bd0b9b224d07c45c620fab5266805309dcd634daa778e75de1b80'
            'c51cc32abd3c26602818445bb266bea50c44e7792ee07569412713ecd82e0b9d'
            '7629af76a6f15b7a5c558699edd3379a936d4b9317411c9841604e83cfac85f6')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    patch -Np1 -i "${srcdir}/pdfchain-fix-crash-on-startup.patch"
    patch -Np1 -i "${srcdir}/pdfchain-fix-desktop-file.patch"
    patch -Np1 -i "${srcdir}/pdfchain-fix-spelling.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    
    ./configure --prefix='/usr'
    
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    # remove undesired doc files
    rm "${pkgdir}/usr/share/doc/${pkgname}/"{AUTHORS,ChangeLog,COPYING,INSTALL,NEWS,README}
}
