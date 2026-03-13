# Maintainer: fa5e4658010be730

# Maintainer: fkzys
pkgname=gitpkg
pkgver=0.7.3
pkgrel=1
pkgdesc="Minimal package manager for git + make projects"
arch=('any')
url="https://gitlab.com/fkzys/gitpkg"
license=('GPL-3.0-or-later')
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
sha256sums=('4114a1128e131df3750a4ff43650b3624f46c001f8bc30d27b3943770f185961')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install

    # gitpkg is managed by pacman — remove it from its own pkglist
    sed -i '/^gitpkg|/d' "${pkgdir}/etc/gitpkg/pkglist"
}
