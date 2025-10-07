# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>
pkgname=fish-foreign-env-git
_pkgname="${pkgname%-git}"
_repo="plugin-foreign-env"
pkgver=r43.7f0cf09
pkgrel=2
pkgdesc="Run foreign bash scripts and capture exported environment variables"
arch=('any')
url="https://github.com/oh-my-fish/plugin-foreign-env"
license=('MIT')
depends=('fish')
makedepends=('git' 'findutils')
source=("plugin-foreign-env::git+${url}")
md5sums=('SKIP')
noextract=()

pkgver() {
    cd "$_repo" || exit 1
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${_repo}"
    find functions -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/fish/{}" \;
    install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

# vim:set ts=4 sw=4 et:
