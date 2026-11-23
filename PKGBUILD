# Maintainer: czyt <czytcn@gmail.com>
pkgname=kander-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="Kanban board for coordinating multiple AI coding agents, with isolated git worktrees and independent reviewer agents"
arch=('x86_64' 'aarch64')
url="https://github.com/dualface/kander"
license=('MIT')
depends=('git')
optdepends=('github-cli: browse issues and sync the board with GitHub'
            'tmux: run the agents in isolated terminals')
provides=('kander')
conflicts=('kander')
# The program is a static Go build: stripping it would rewrite upstream's
# binary for no gain, and a debug package would be just as large.
options=('!strip' '!debug')

_archive_x86_64="kander-linux-amd64.tar.gz"
_archive_aarch64="kander-linux-arm64.tar.gz"

_releases="https://github.com/dualface/kander/releases/download/v${pkgver}"

source=("LICENSE::https://raw.githubusercontent.com/dualface/kander/v${pkgver}/LICENSE")
source_x86_64=("${_archive_x86_64}::${_releases}/${_archive_x86_64}")
source_aarch64=("${_archive_aarch64}::${_releases}/${_archive_aarch64}")

sha256sums=('365a3932a1297fc06250ea4ee0f23ee99da5a8a567b3c84b3e879877170c0836')
sha256sums_x86_64=('7045c331f3e91e47e98e0cce99d3a79869f79aa8ad18c54eaaca2fd0eb657ce6')
sha256sums_aarch64=('221cb826a8df5c231d1cf5ced836b832841ef646b108de71cbc05eb89e1e76ba')

package() {
    local archive_var="_archive_${CARCH}"
    local archive="${!archive_var}"

    # The archive holds the program and nothing else.
    install -d "${pkgdir}/usr/bin"
    tar -xzOf "${srcdir}/${archive}" kander > "${pkgdir}/usr/bin/kander"
    chmod 755 "${pkgdir}/usr/bin/kander"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
