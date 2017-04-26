# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor:

pkgname=proxmox-dab-git
pkgver=r47.0580010
pkgrel=2
pkgdesc="Debian Appliance Builder - A tool to create OpenVZ and LXC Debian instances for Proxmox"
arch=('any')

url="https://git.proxmox.com/?p=dab.git;a=summary"
license=('GPL2')

depends=(perl perl-uuid wget lxc)
provides=('proxmox-dab')
conflicts=('proxmox-dab')

# install=${pkgname}.install
# Don't leave empty directories in packages
options=('!emptydirs' purge)

source=('git://git.proxmox.com/git/dab.git')
sha512sums=('SKIP')

# Use number of revisions since beginning of the history
pkgver() {
    cd dab
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd dab
    make DESTDIR=$pkgdir install
    mv $pkgdir/usr/sbin $pkgdir/usr/bin
    mkdir $pkgdir/usr/share/perl5/vendor_perl
    mv $pkgdir/usr/share/perl5/PVE $pkgdir/usr/share/perl5/vendor_perl/PVE
}
