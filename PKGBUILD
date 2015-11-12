# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Vincenzo Maffione <v.maffione@gmail.com>
pkgname=qrun
pkgver=0.1
pkgrel=1
pkgdesc="A command line tool to run QEMU in the most common configurations"
arch=('any')
url=
license=('GPL')
groups=()
depends=('python' 'qemu' 'bridge-utils' 'iproute2')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot="https://github.com/vmaffione/qrun"
_gitname="qrun"

build() {
    # Download the latest netmap code from the public repository
    cd "$srcdir"
    msg "Connecting to GIT server...."
    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
        cd "$srcdir/$_gitname"
    fi
    msg "GIT checkout done or server timeout"
}

package() {
    # Install the script into /usr/bin
    mkdir -p "$pkgdir/usr/bin"
    install "$srcdir/$_gitname/qrun.py" "$pkgdir/usr/bin/qrun"
}

# vim:set ts=2 sw=2 et:
