# Maintainer: zer0-x < Matrix: "@zer0-x:kde.org" >

pkgname="nvim-lazy-git"
_pkgname=${pkgname%-git}
pkgver=stable.r11.g716b6cc
pkgrel=1
pkgdesc="Modern, fast and version lockable plugin manager for Neovim with some profiling tools to optimize performance"
arch=("any")
url="https://github.com/folke/lazy.nvim"
license=("APACHE")
depends=("neovim")
makedepends=("git")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}#branch=main")
sha512sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname}"

    find doc lua -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/nvim/runtime/{}" \;

    install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
