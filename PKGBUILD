# Maintainer: PhrozenByte <statecraft at daniel-rudolf dot de>

pkgname=statecraft
pkgver=1.1.0
pkgrel=1
pkgdesc="StateCraft is a CLI tool to create complex directory structures via scripts on Linux."
url='https://github.com/PhrozenByte/statecraft'
license=('GPL-3.0-only')
arch=('any')
depends=('bash' 'coreutils' 'findutils' 'util-linux')
optdepends=("btrfs-progs: support for 'btrfs.sh' state script"
            "lvm2: support for 'lvm.sh' state script"
            "tar: support for 'tar-xz.sh' state script"
            "xz: support for 'tar-xz.sh' state script"
            "jq: support for 'disk-info.sh' state script")
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bc86f9a5678721927108ae866a3a6f7d987a51b0cdc40acf2a8a7464e5c871a9')

package() {
    cd $pkgname-$pkgver

    # remove unsupported state scripts
    rm -v ./src/lib/statecraft/state-scripts/fcos-release.sh

    make DESTDIR="$pkgdir" prefix=/usr install
}
