# Maintainer: fa5e4658010be730

# Maintainer: fkzys
pkgname=gitpkg
pkgver=0.7.9
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
sha256sums=('95290e663fbdf7ab260f0c2f228ef4d242538b16dc6ff9667a1623b4f9e6f469')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install

    # gitpkg is managed by pacman — remove it from its own pkglist
    sed -i '/^gitpkg|/d' "${pkgdir}/etc/gitpkg/pkglist"
}
