# Maintainer: Oliver Rümpelein <oli_r@fg4f.de>
pkgname=mergerfs
pkgver=2.12.2
pkgrel=1
pkgdesc="Another FUSE union filesystem"
arch=('i686' 'x86_64')
url="https://github.com/trapexit/mergerfs"
license=('MIT')
depends=(fuse)
options=(!emptydirs)
source=("https://github.com/trapexit/mergerfs/archive/${pkgver}.tar.gz")
md5sums=('9d086a806f1b195c61139c419fda4aef')
sha256sums=('514017be5c8510520232c176718a36787b138ffead32b48fd35cb2432c1e9f37')
sha512sums=('3bc31dfebe60d43b53abc80f4d06e918883720cb22bbfad15e523022734f7edbf37466bc71ec7ab92000b5d2c0327f3238e671029db1b0eacccd66656c4a1ad7')

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
