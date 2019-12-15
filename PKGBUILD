# Maintainer: Otto Sabart <aur@seberm.com>
# Contributor: Jacob Jenner Rasmussen <jacob@jener.dk>

# Ref.: https://github.com/QubesOS/qubes-app-linux-split-gpg/blob/master/archlinux/PKGBUILD

pkgname=qubes-gpg-split
pkgver=2.0.42
pkgrel=1
pkgdesc="Split GPG implements a concept similar to having a smart card with your private GPG keys, except that the role of the “smart card” plays another Qubes AppVM."
arch=("x86_64")
url="https://qubes-os.org"
license=('GPL')
depends=('gnupg' 'zenity')
makedepends=(pkg-config make gcc pandoc)

source=(https://github.com/QubesOS/qubes-app-linux-split-gpg/archive/v${pkgver}.tar.gz)
sha512sums=('9ddfd499c0e1f18d5f0fbbf1ae6aadbc494dee39aaa796687a0773cf02ef6736db3f17dda456f5632312246c6441eb699ec7dd53146cc2a84ca78b3a450db6cd')

_srcname=qubes-app-linux-split-gpg-${pkgver}


build() {
    cd "$srcdir/$_srcname/"
    cd "src/"
    make
}

package() {
    cd "$srcdir/$_srcname/"
    make install-vm DESTDIR=$pkgdir

    # Archlinux packaging guidelines: /var/run is a symlink to a tmpfs. Don't create it.
    rm -r "${pkgdir}/var/run"
}
