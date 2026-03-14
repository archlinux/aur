# Maintainer: fa5e4658010be730

# Maintainer: fkzys
pkgname=gitpkg
pkgver=0.7.8
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
sha256sums=('25d9d54b30811213c2c3ff1dc12c27d2ff3338370e309b4a93f1b181680e52bd')

package() {
    cd "${pkgname}-v${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install

    # gitpkg is managed by pacman — remove it from its own pkglist
    sed -i '/^gitpkg|/d' "${pkgdir}/etc/gitpkg/pkglist"
}
