# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=mergerfs
pkgver=2.14.0
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
license=('MIT')
depends=(fuse)
options=(!emptydirs)
source=("https://github.com/trapexit/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('665b18650376e22bc839e044e7ae6b76')
sha256sums=('91b323ac848d373dde455a2f7bc7567b31d2def81839ae801c1d38d1ffb3ba61')
sha512sums=('e2af096479493e804518db0bad5ef3fa2661172c914d791447367d5a2d13b519743bfe608f821fce328b07a4058b46d92149623347d7abbd3c73026e03c728b1')

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
