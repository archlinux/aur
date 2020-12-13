# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Maintainer: Brad Fanella <bradfanella@archlinux.us>
# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

_basename=avrdude
pkgname=avrdude-buspirate-bug58078
pkgver=6.3
pkgrel=8
epoch=1
pkgdesc="AVRDUDE with bug #58078 patch applied for Bus Pirate support on GCC>=9"
arch=('x86_64')
url="https://savannah.nongnu.org/bugs/?58078"
license=('GPL')
depends=('readline' 'libftdi' 'libusb-compat' 'elfutils')
provides=('avrdude')
conflicts=('avrdude')
source=(https://download.savannah.gnu.org/releases/avrdude/${_basename}-${pkgver}.tar.gz
        '0001-buspirate-remove-compound-literals-fixes-GCC-9.patch::https://savannah.nongnu.org/bugs/download.php?file_id=48706')
sha512sums=('b671008388d6a552e71066fec46429bc7f6639e8eac41113bcbba5a56212b78be31fcf04956b31e11c6b14888b0f6e825f7458395b9ff4fc28406074c7ded2b2'
            'fea80d35612c6c9698edf58946bd8c0d056bbced99065c443718b93af99853416bc61ba7f2a85447af4f9945694fa1b3e6590dc8cc72af9b644c1333d5088b5e')

build() {
	cd "${_basename}-${pkgver}"

    patch -p1 < ../0001-buspirate-remove-compound-literals-fixes-GCC-9.patch
    ./configure --mandir=/usr/share/man \
		    --prefix=/usr \
		    --sysconfdir=/etc \
		    --enable-linuxgpio
    make
}

package() {
    cd "${_basename}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}
