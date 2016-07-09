# Maintainer: Saleem Rashid (spudowiar) <spudowiar@outlook.com>
_pkgname=s4a
pkgname="${_pkgname}-bin"
pkgrel=1
pkgver=1.6
pkgdesc='A customized version of Scratch (http://scratch.mit.edu) prepared to interact with Arduino boards.'
arch=('any')
url='http://s4a.cat'
depends=('squeak-vm')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
    'http://vps34736.ovh.net/S4A/S4A16.deb'
)
sha256sums=('21175999fe5ff6e04d715c16d616caf52737597fa50608a414e03608b9032c82')

package() {
    tar xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    ln -sf squeak "${pkgdir}/usr/bin/s4a_squeak_vm"
    mv "${pkgdir}/usr/lib/s4a" "${pkgdir}/usr/share/s4a"
    rm -rf "${pkgdir}/usr/share/s4a/Plugins"
    sed -i "${pkgdir}/usr/bin/s4a" -e '/^-plugins/d' \
                                   -e 's|/usr/lib/s4a|/usr/share/s4a|g'
}
