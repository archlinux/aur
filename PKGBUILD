# Maintainer: Sateallia <mail at sateallia dot org>

pkgname=ptf-ctf-thumbnailer
pkgver=1.0.0
pkgrel=1
pkgdesc='A thumbnailer for PSP PTF and CTF theme files'
arch=('x86_64')
url='https://coding.homdworks.org/sateallia/ptf-ctf-thumbnailer'
license=('MIT')
depends=('libpng' 'zlib')

source=("${pkgname}-${pkgver}.tar.gz::https://coding.homdworks.org/sateallia/ptf-ctf-thumbnailer/archive/v${pkgver}.tar.gz")
sha256sums=('945b9c33bedbde1468d388629cf41a2f057f3ebd27f60eea2a46e39407863679')

prepare() {
    cd "${pkgname}"
    sed -i 's|/usr/local/bin/|/usr/bin/|g' ptf.thumbnailer ctf.thumbnailer
}

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    install -D -m755 ptf-ctf-thumbnailer "${pkgdir}/usr/bin/ptf-ctf-thumbnailer"
    install -D -m644 ptf.thumbnailer "${pkgdir}/usr/share/thumbnailers/ptf.thumbnailer"
    install -D -m644 ctf.thumbnailer "${pkgdir}/usr/share/thumbnailers/ctf.thumbnailer"
    install -D -m644 ptf-ctf.xml "${pkgdir}/usr/share/mime/packages/ptf-ctf.xml"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
