# Maintainer: Oliver Rümpelein <oli_r@fg4f.de>
pkgname=mergerfs
pkgver=2.13.1
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
license=('MIT')
depends=(fuse)
options=(!emptydirs)
source=("https://github.com/trapexit/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('9395ff637a76ebf8258d037cb3a771c0')
sha256sums=('d09054d504fcd277ea5d0b6c372e2fa4ac7dacf59e9c50a209ac647fc7ceab6c')
sha512sums=('b739772eb23252a59b381c9e1b87c043163cf847c704d6f525226fec63db0f7f8afc2770e4d9138fd120b2fadfe3b5ac643d89bcf02593deb253ed25dba79394')

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
