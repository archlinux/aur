# Maintainer: fkzys <fkzys at proton dot me>

pkgname=gitpkg
pkgver=0.8.0
pkgrel=1
pkgdesc="Minimal package manager for git + make projects"
arch=('any')
url="https://gitlab.com/fkzys/gitpkg"
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('3d8102e0943726cb4802d68a35bd767ec1657be8008d7b6457b9f8ffc04d5d36')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install

    # gitpkg is managed by pacman — remove it from its own pkglist
    sed -i '/^gitpkg|/d' "${pkgdir}/etc/gitpkg/pkglist"
}
