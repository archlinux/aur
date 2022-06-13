# Maintainer: Otto Sabart <aur@seberm.com>
# Contributor: Jacob Jenner Rasmussen <jacob@jener.dk>

# Ref.: https://github.com/QubesOS/qubes-app-linux-split-gpg/blob/master/archlinux/PKGBUILD


pkgname=qubes-gpg-split
_gitname=${pkgname%-git*}
pkgver=2.0.60
pkgrel=1
pkgdesc="Split GPG implements a concept similar to having a smart card with your private GPG keys, except that the role of the “smart card” plays another Qubes AppVM."
arch=("x86_64")
url="https://github.com/QubesOS/qubes-app-linux-split-gpg"
license=('GPL')
depends=('gnupg' 'zenity')
makedepends=(pkg-config make gcc pandoc)
validpgpkeys=('0AF64C3B1F1214B38C8C57861FA2DBE674387CC3'  # Otto Sabart
              '0064428F455451B3EBE78A7F063938BA42CFA724'  # Marek Marczykowski-Górecki
              '427F11FD0FAA4B080123F01CDDFA1A3E36879494'  # Qubes Master Signing Key
)

source=("$_gitname::git+https://github.com/QubesOS/qubes-app-linux-split-gpg.git?signed#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${_gitname}/"
    cd "src/"
    make
}

package() {
    cd "${srcdir}/${_gitname}/"
    make install-vm DESTDIR="$pkgdir"

    # Archlinux packaging guidelines: /var/run is a symlink to a tmpfs. Don't create it.
    rm -r "${pkgdir}/var/run"
}
