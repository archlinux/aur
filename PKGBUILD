# Maintainer: 160R <160R@protonmail.com>

pkgname=zr-git
pkgver=git
pkgrel=1
url=https://github.com/jedahan/zr
makedepends=('rust' 'cargo')
depends=('git')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="quick, simple zsh package manager"
license=('MPL-2.0')
source=("git+https://github.com/jedahan/zr.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}"/zr
    git describe --tags --abbrev=0 --match="[0-9]*\.[0-9]*\.[0-9]*"
}

package() {
    cd "${srcdir}"/zr
    cargo install --path . --root="${pkgdir}/usr"
    rm "${pkgdir}/usr/.crates.toml"

    install -D -m644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
