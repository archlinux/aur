# Maintainer: ugla <ugla at u8 dot is>
pkgname=passphrase
pkgrel=1
pkgver=1.3
pkgdesc="Small, simple passphrase generator, written in Zig"
arch=('any')
url="https://git.sr.ht/~alva/${pkgname}"
license=('MIT')
makedepends=('zig>=0.9.1' 'git')
source=("git+https://git.sr.ht/~alva/${pkgname}#tag=${pkgver}" "git+https://github.com/jecolon/ziglyph.git")
sha256sums=('SKIP' 'SKIP')

check() {
    cd "${srcdir}/${pkgname}"
    zig build test
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule update --init --recursive
    git config submodule.ziglyph.url "${srcdir}/ziglyph"
    git submodule update
}

package() {
    cd "${srcdir}/${pkgname}"
    zig build install -Drelease-fast --prefix "${pkgdir}/usr"
}
