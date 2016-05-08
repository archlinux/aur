# Maintainer: Oliver Rümpelein <oli_r@fg4f.de>
pkgname=mergerfs
pkgver=2.13.0
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
license=('MIT')
depends=(fuse)
options=(!emptydirs)
source=("https://github.com/trapexit/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('05f9dada748117cd208bba238c774d4b')
sha256sums=('6150fa2b83ff89386835d6df1d3d94f3b0b075752f10a6bbf84b15c2b43f391c')
sha512sums=('86eb685350dee1cb4411210db18c7a888f107c973db474dbccdd9a873de8147b03f8df9830574a4ee483bd87640f11941e313d8896dcfefb3113433c016b7eea')

build() {
    cd ./"${pkgname}-${pkgver}" || exit
    make DESTDIR="${pkgdir}" PREFIX="/usr" SBINDIR="/usr/bin"
}

package()
{
    cd "${srcdir}/${pkgname}-${pkgver}" || exit
    mkdir -p "${pkgdir}"/usr/{share,bin}
    mkdir -p "${pkgdir}"/usr/share/licenses/mergerfs
    make DESTDIR=${pkgdir} PREFIX=/usr SBINDIR="/usr/bin" install
    install -m 644 LICENSE "${pkgdir}/usr/share/licenses/mergerfs/LICENSE"
}
