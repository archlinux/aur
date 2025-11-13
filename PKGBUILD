# Maintainer: PhrozenByte <statecraft at daniel-rudolf dot de>

pkgname=statecraft
pkgver=1.0.2
pkgrel=1
pkgdesc="StateCraft is a CLI tool to create complex directory structures via scripts on Linux."
url='https://github.com/PhrozenByte/statecraft'
license=('GPL-3.0-only')
arch=('any')
depends=('bash' 'coreutils' 'util-linux')
optdepends=("btrfs-progs: support for 'btrfs.sh' state script"
            "lvm2: support for 'lvm.sh' state script"
            "tar: support for 'tar-xz.sh' state script"
            "xz: support for 'tar-xz.sh' state script"
            "jq: support for 'disk-info.sh' state script")
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a5e8d70550098eb9bedb8d33555d9bb5adccc0c419a307c3a77d975fbfdc2928')

package() {
    cd $pkgname-$pkgver

    # remove unsupported state scripts
    rm -v ./src/lib/statecraft/state-scripts/fcos-release.sh

    make DESTDIR="$pkgdir" prefix=/usr install
}
