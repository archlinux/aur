# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>
pkgname=debloat-git
pkgver=r201.e472d44
pkgrel=1
pkgdesc="Script for debloating network interfaces"
arch=(any)
url="https://github.com/dtaht/deBloat"
license=('public domain')
depends=('ethtool' 'iproute2')
makedepends=('git')
source=("debloat::git+https://github.com/dtaht/deBloat.git" "debloat.install" "debloat@.service")
install="debloat.install"

pkgver() {
    cd "$srcdir/debloat/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm 644 "debloat@.service" "$pkgdir/usr/lib/systemd/system/debloat@.service"
    install -Dm 755 "$srcdir/debloat/src/debloat.sh" "$pkgdir/usr/lib/debloat/debloat.sh"
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP'
         'c88706b6f89df594b6c9c7cd9f7b2018'
         '028bc239aced54672e7a97bd673240c1')
