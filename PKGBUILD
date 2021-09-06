# Maintainer: danieltetraquark
# Contributor: MediaArea.net SARL <Info@MediaArea.net> (original PKGBUILD included in the source files)

pkgname=dvrescue
pkgver=0.20.11
pkgrel=1
pkgdesc="Archivist-made software that supports data migration from DV tapes into digital files suitable for long-term preservation"
url="https://mediaarea.net/DVRescue"
license=('BSD')
source=("https://mediaarea.net/download/source/${pkgname}/${pkgver}/${pkgname}_${pkgver}.tar.xz")
arch=('i686' 'x86_64')
makedepends=('libzen>=0.4.38' 'libmediainfo>=20.09' 'xmlstarlet')
sha256sums=('7eb31561616d6b87f486414f91094a3a10a0364485575b27e2c2cbf903b50864')

prepare() {
    cd "${srcdir}"/dvrescue/Project/GNU/CLI
    sh ./autogen
    ./configure --prefix=/usr
}

build() {
    cd "${srcdir}"/dvrescue/Project/GNU/CLI
    make
}

package() {
    cd "${srcdir}"/dvrescue/Project/GNU/CLI
    make DESTDIR="${pkgdir}" install

    install -D -m 0644 "${srcdir}"/dvrescue/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -D -m 0644 "${srcdir}"/dvrescue/tools/dvrescue.xsd "${pkgdir}"/usr/share/doc/${pkgname}/dvrescue.xsd
    install -D -m 0644 "${srcdir}"/dvrescue/History.txt "${pkgdir}"/usr/share/doc/${pkgname}/History.txt
}
