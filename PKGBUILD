# Maintainer: Oliver Rümpelein <arch@pheerai.de>
pkgname=mergerfs
pkgver=2.16.1
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
license=('MIT')
depends=(fuse)
options=(!emptydirs)
source=("https://github.com/trapexit/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('05e4df9c1c4a711eb0c5ac19373642a5ba116eb3c9dc4748d8bc0ea2190faff34d39dec91b9371cec3439b0bcb849ce59cbb0a5d95be9cfa78b388f0dfe37113')

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
