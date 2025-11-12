# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>

_pkgname="firefox-omni-tweaks"
pkgname="firefox-omni-tweaks-git"
provides=("firefox-omni-tweaks")
conflicts=("firefox-omni-tweaks")
pkgver="r77.c6637e3"
pkgrel=1
pkgdesc="A script that disables the clickSelectsAll behavior of Firefox, and more."
arch=("any")
url="https://github.com/SebastianSimon/firefox-omni-tweaks"
license=("MIT")
depends=("bash")
makedepends=("git")
source=("${pkgname}::git+${url}.git")
sha256sums=("SKIP")
install="${_pkgname}.install"

pkgver() {
    cd "$pkgname"
    # There are no tags in the repo,
    # "If there are no tags then use number of revisions since beginning of the history"
    # https://wiki.archlinux.org/title/VCS_package_guidelines#Git
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 ./fixfx.sh "${pkgdir}/usr/bin/fixfx"
    install -Dm644 ./LICENSE  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
