# Maintainer: Oliver Rümpelein <oli_r@fg4f.de>
pkgname=mergerfs
pkgver=2.12.0
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
license=('MIT')
depends=(fuse)
options=(!emptydirs)
source=("https://github.com/trapexit/mergerfs/archive/${pkgver}.tar.gz")
md5sums=('ae40b29e398a2e91e1fd5b0b1b8fcedd')
sha256sums=('17a53516909c9c72a9a168392da7eedb8fc4a74bb5dbfe37593835fbc6262e8b')
sha512sums=('7008411ade054baa3c982591ab6b595f00549d6b53d5e5a039b8fff3ba86995018c1f407d36a2f4b3cbd2794d3215202529ddb617676ea7b2679a9fa48edb73e')

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
