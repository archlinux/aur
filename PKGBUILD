# Maintainer: JisuWoniu <jswn@jswn9945.xyz>

pkgname=('npm-corepack' 'yarn-corepack' 'pnpm-corepack')
pkgbase='npm-yarn-pnpm-corepack'
pkgver=0.1.0
pkgrel=1
pkgdesc='Using corepack shim to provide npm, yarn and/or pnpm.'
arch=('any')
url='https://github.com/nodejs/corepack/'
license=('MIT')
depends=("corepack")



_package() {
    _pkgname=$1
    mkdir -p "shims/$_pkgname"
    corepack enable --install-directory "shims/$_pkgname" "$_pkgname"

    install -dm755 "$pkgdir/usr/bin"

    # canonicalize symlink target paths
    for item in "shims/$_pkgname"/*; do
        ln -sf "$(readlink -m "$item")" "$pkgdir/usr/bin/${item##*/}"
    done
}

package_npm-corepack() {
    provides=(npm)
    conflicts=(npm)
    install="npm-corepack.install"

    _package npm
}

package_yarn-corepack() {
    provides=(yarn)
    conflicts=(yarn)
    install="yarn-corepack.install"

    _package yarn
}

package_pnpm-corepack() {
    provides=(pnpm)
    conflicts=(pnpm)
    install="pnpm-corepack.install"

    _package pnpm
}
