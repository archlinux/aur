# Maintainer: lucas <lucas.bmior@gmail.com>

pkgname=systemd-boot-btrfs-snapshots-git
pkgver=r44.e168413
pkgrel=1
pkgdesc="Btrfs snapshot scripts with systemd-boot integration"
arch=(x86_64)
url="https://github.com/lucas-mior/systemd-boot-btrfs-snapshots"
license=(AGPL)
depends=(btrfs-progs inotify-tools)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')  # git sources are variable, skip checksum
install="PKGBUILD.install"

pkgver() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}" || exit 1
    export DESTDIR="$pkgdir"
    export PREFIX="/usr"
    ./build.sh install
}
