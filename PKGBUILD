# Maintainer: Otto Sabart <aur@seberm.com>
# Contributor: Frédéric Pierret <frederic.pierret@qubes-os.org>

# Ref.: https://github.com/QubesOS/qubes-core-qrexec/tree/master/archlinux

pkgname=qubes-vm-qrexec
pkgver=4.1.18
pkgrel=1
_gitname=${pkgname%-git*}
pkgdesc="The Qubes qrexec files (qube side)"
arch=("x86_64")
url="http://qubes-os.org/"
license=('GPL')
depends=(qubes-libvchan)
makedepends=(gcc make pkg-config qubes-libvchan pandoc python-setuptools lsb-release)
provides=('qubes-vm-qrexec')
install=PKGBUILD.install
validpgpkeys=('0AF64C3B1F1214B38C8C57861FA2DBE674387CC3'  # Otto Sabart
              '0064428F455451B3EBE78A7F063938BA42CFA724'  # Marek Marczykowski-Górecki
              '427F11FD0FAA4B080123F01CDDFA1A3E36879494'  # Qubes Master Signing Key
)

source=(
    "$_gitname::git+https://github.com/QubesOS/qubes-core-qrexec.git?signed#tag=v${pkgver}"
)

sha512sums=(
  'SKIP'
)

build() {
    cd "${srcdir}/${_gitname}/"

    make all-base
    make all-vm
}

package() {
    cd "${srcdir}/${_gitname}/"

    make install-base DESTDIR="$pkgdir" SBINDIR=/usr/bin LIBDIR=/usr/lib SYSLIBDIR=/usr/lib SYSTEM_DROPIN_DIR=/usr/lib/systemd/system USER_DROPIN_DIR=/usr/lib/systemd/user
    make install-vm DESTDIR="$pkgdir" SBINDIR=/usr/bin LIBDIR=/usr/lib SYSLIBDIR=/usr/lib SYSTEM_DROPIN_DIR=/usr/lib/systemd/system USER_DROPIN_DIR=/usr/lib/systemd/user
}
