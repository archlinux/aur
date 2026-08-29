# Maintainer: Christian Kühn (damachine3 at proton dot me)

_pkgbase=tkginstaller
pkgname=${_pkgbase}-git
pkgver=0.55.9.r391.g47fb641
pkgrel=1
provides=("${_pkgbase}=${pkgver}")
conflicts=("${_pkgbase}")
pkgdesc="bash wrapper to build & install Frogging-Family stuff with ease"
arch=('any')
url="https://github.com/damachine/${_pkgbase}"
license=('MIT')
depends=(
    'bash'
    'curl'
    'fzf'
    'git'
)
optdepends=(
    'bat: syntax-highlighted config and log previews'
    'glow: rendered Markdown previews'
    'nano: fallback configuration editor'
    'onefetch: repository summaries'
    'opendoas: privilege escalation (alternative to sudo)'
    'sudo: privilege escalation (alternative to opendoas)'
    'wdiff: word-based configuration comparisons'
)
install=tkginstaller.install
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgbase}"

    local version
    version=$(sed -n 's/^readonly pkgver="v\([^"]*\)"/\1/p' "${_pkgbase}")

    printf '%s.r%s.g%s' \
        "$version" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

package() {
    install -Dm755 "${srcdir}/${_pkgbase}/${_pkgbase}" "${pkgdir}/usr/bin/${_pkgbase}"
}
