# Maintainer: Cahian Freire <cahianfreire at gmail dot com>

_author="cbrnix"
_gitname="Newaita-reborn"
pkgname=newaita-reborn-icons-git
pkgver=r71.c0bdeb5
pkgrel=1
pkgdesc="Remaster Newaita icon theme"
arch=("any")
url="https://github.com/${_author}/${_gitname}"
license=("GPL3")
makedepends=("git" "rsync")
provides=("${pkgname%-icons-git}" "${pkgname%-git}")
conflicts=("${pkgname%-icons-git}" "${pkgname%-git}")
options=("!strip")  # Increase package creation performance
source=("git+${url}.git")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}"
    mkdir -p "${pkgdir}/usr/share/icons"

    # Use Rsync to show progress bar
    # Use `--no-i-r` to show more accurate values in the progress bar
    rsync -ahrH --no-i-r --info=progress2 [Nn]ewaita* "${pkgdir}/usr/share/icons"

    find "${pkgdir}" -type f -exec chmod 644 "{}" \+
    find "${pkgdir}" -type d -exec chmod 755 "{}" \+
}
