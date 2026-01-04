# Maintainer: Claude <noreply@anthropic.com>
# Packaging Repo: https://github.com/orange-guo/aur-packages

pkgname=vibe-kanban-bin
_pkgname=vibe-kanban
pkgver=0.0.143
_binary_tag=v0.0.143-20251229180119
pkgrel=1
pkgdesc="Vibe Kanban - AI-powered Kanban board (Binary)"
arch=('x86_64')
url="https://vibekanban.com"
license=('Proprietary')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=()
makedepends=('unzip')
options=('!strip')

install=vibe-kanban-bin.install

source=("https://npm-cdn.vibekanban.com/binaries/${_binary_tag}/linux-x64/${_pkgname}.zip"
        "vibe-kanban.service")
sha256sums=('f841e2210216608ef0078296babe4d78f69e1810412ea9a89f5df957128d5569'
            '48b6d94e9693f7098ad7d3786ff08b648ce08ab8fcfe8ff13cff97906a12a33f')

package() {
    cd "${srcdir}"

    # Install binary
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Install systemd service
    if [ -f "vibe-kanban.service" ]; then
        install -Dm644 "vibe-kanban.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
    fi

    # Install license if available (Wait, where is the license?)
    # The zip only had the binary. The npm package had LICENSE.
    # The binary zip doesn't have LICENSE?
    # I should check if LICENSE is separate.
    # If not, I might need to download it separately or skip it.
    # Previous PKGBUILD checked "if [ -f LICENSE ]".
    # Since I'm not using NPM package, I don't have LICENSE file extracted.
    # I will omit it for now or source it from somewhere else.
}
