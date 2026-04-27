# Maintainer: fkzys <fkzys at proton dot me>

pkgname=gitpkg
pkgver=0.8.0
pkgrel=1
pkgdesc="Minimal package manager for git + make projects"
arch=('any')
url="https://github.com/fkzys/gitpkg"
license=('AGPL-3.0-or-later')
depends=(
    'bash'
    'git'
    'make'
    'findutils'
    'gawk'
    'coreutils'
    'bubblewrap'
    'verify-lib'
)
optdepends=(
    'bash-completion: bash tab completions'
    'zsh: zsh tab completions'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6e959ef6dc6add86abb17eb5a4e03786f593eb616af2447749dd3356ac8b2248')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install

    # gitpkg is managed by pacman — remove it from its own pkglist
    sed -i '/^gitpkg|/d' "${pkgdir}/etc/gitpkg/pkglist"
}
