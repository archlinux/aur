# Maintainer: Otto Sabart <aur@seberm.com>
# Maintainer: Olivier Medoc <o_medoc@yahoo.fr>

pkgname=qubes-libvchan-xen
_gitname=${pkgname%-git*}
pkgver=4.1.7
pkgrel=1

pkgdesc="The Qubes core libraries for installation inside a Qubes Dom0 and VM."
arch=("x86_64")
url="https://github.com/QubesOS/qubes-core-vchan-xen"
license=('GPL')
depends=(qubes-vm-xen)
makedepends=(qubes-vm-xen)
provides=('qubes-core-libs' 'qubes-libvchan')
validpgpkeys=('0AF64C3B1F1214B38C8C57861FA2DBE674387CC3'  # Otto Sabart
              '0064428F455451B3EBE78A7F063938BA42CFA724'  # Marek Marczykowski-Górecki
              '427F11FD0FAA4B080123F01CDDFA1A3E36879494'  # Qubes Master Signing Key
)

source=("$_gitname::git+https://github.com/QubesOS/qubes-core-vchan-xen.git?signed#tag=v${pkgver}")
sha512sums=('SKIP')


build() {
    cd "${srcdir}/${_gitname}/"

    (cd vchan; make -f Makefile.linux)
}

package() {
    cd "${srcdir}/${_gitname}/"

    make install DESTDIR="$pkgdir" LIBDIR=/usr/lib INCLUDEDIR=/usr/include
}
