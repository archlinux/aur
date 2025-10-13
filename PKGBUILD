# Maintainer: lucas <lucas.bmior@gmail.com>

pkgname=gummibbs
pkgver=r293.e3c4c56
pkgrel=1
pkgdesc="Btrfs snapshot scripts with systemd-boot integration"
arch=(x86_64)
url="https://github.com/lucas-mior/gummibbs"
license=(AGPL)
depends=(btrfs-progs inotify-tools arch-install-scripts)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')  # git sources are variable, skip checksum
install="PKGBUILD.install"
backup=(etc/gummibbs.conf)

pkgver() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    ./gummibbs-common.bash
    export DESTDIR="$pkgdir"
    export PREFIX="/usr"
    ./build.sh install
}
