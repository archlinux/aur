# Maintainer: hina <192247746+Hinikaa@users.noreply.github.com>
pkgname=wisp-shell
pkgver=3.3.0
pkgrel=1
pkgdesc='Small Linux shell written in C++17 with Lua 5.4 embedded for config and structured pipelines'
arch=('x86_64' 'aarch64')
url='https://github.com/Hinikaa/wisp'
license=('MIT' 'BSD-2-Clause')
depends=('lua54' 'glibc')
makedepends=('pkgconf')
checkdepends=('python')
optdepends=('luarocks: package management via the pkg builtin')
install=wisp-shell.install
source=("wisp-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1de3f78b955f29a0d0e01fd57b747737f41e0dd0b28b1a0db9f66081b9d04570')

build() {
    cd "wisp-${pkgver}"
    make wisp
}

check() {
    cd "wisp-${pkgver}"
    make test
}

package() {
    cd "wisp-${pkgver}"
    install -Dm755 wisp "${pkgdir}/usr/bin/wisp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 LINENOISE_LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LINENOISE_LICENSE"
    install -Dm644 example-init.lua "${pkgdir}/usr/share/doc/${pkgname}/example-init.lua"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
