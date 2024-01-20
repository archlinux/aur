# Maintainer: JisuWoniu <jswn@jswn9945.xyz>

pkgname='yarn-pnpm-corepack'
pkgver=0.2.0
pkgrel=1
pkgdesc='Using corepack shim to provide yarn and pnpm, while preserving npm.'
arch=('any')
url='https://github.com/nodejs/corepack/'
license=('MIT')
depends=("nodejs")
provides=("yarn" "pnpm")
conflicts=("yarn" "pnpm")
install=yarn-pnpm-corepack.install

package() {
    install -dm755 "$pkgdir/usr/bin"
    corepack enable --install-directory "$pkgdir/usr/bin"

    # canonicalize symlink target paths
    for bin in "$pkgdir/usr/bin/"*; do
        ln -sf "$(readlink -m "$bin")" "$bin"
    done
}
