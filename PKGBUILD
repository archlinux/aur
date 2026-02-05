# Maintainer: Claude <noreply@anthropic.com>
# Packaging Repo: https://github.com/orange-guo/aur-packages

pkgname=vibe-kanban-bin
_pkgname=vibe-kanban
pkgver=0.1.4
_binary_tag=v0.1.4-20260205093507
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
sha256sums=('4242e3c47441b4ca34ed0e1d3e2f87d7b5089f98e03b4e64d47a1259e158b3bc'
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
