# Maintainer: fkzys <fkzys at proton dot me>

pkgname=gitpkg
pkgver=0.9.0
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
backup=('etc/gitpkg/gitpkg.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5e694420146b38ff7884ce7e5b981f4063c8b2838dc7b8c7e38c0e12bb32b036')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install

    # gitpkg is managed by pacman — remove it from its own pkglist
    sed -i '/^gitpkg|/d' "${pkgdir}/etc/gitpkg/pkglist"
}
