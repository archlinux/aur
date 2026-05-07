# Maintainer: fkzys <fkzys at proton dot me>

pkgname=gitpkg
pkgver=0.8.1
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
sha256sums=('61d668d0011e230915d29faa5ef61ee9a5c10189c6bb8998cfe8e02dcc47d0e6')

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install

    # gitpkg is managed by pacman — remove it from its own pkglist
    sed -i '/^gitpkg|/d' "${pkgdir}/etc/gitpkg/pkglist"
}
