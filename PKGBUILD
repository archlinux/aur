# Maintainer: Alessandro Fulgini <fuljo97 at gmail dot com>

pkgname='tokyonight-gtk-theme-git'
_reponame='Tokyo-Night-GTK-Theme'
pkgver=r70.2f566d89
pkgrel=2
pkgdesc='A GTK theme based on the Tokyo Night colour palette.'
arch=("any")
url="https://github.com/Fausto-Korpsvart/${_reponame}"
license=("GPL3")
depends=("gnome-themes-extra")
optdepends=("gtk-engine-murrine")
makedepends=("git" "sassc")
source=("git+${url}.git")
sha256sums=('SKIP')
options=(!strip) # trying to strip symbols from icons is too expensive

pkgver() {
    cd "${_reponame}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_reponame}"

    # docs
    install -D -m0644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    install -D -m0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

    # themes
    dist="${pkgdir}/usr/share/themes"
    mkdir -p "${dist}"
    cd themes
    ./install.sh --dest "${dist}"

    # icons
    dist="${pkgdir}/usr/share/icons"
    mkdir -p "${dist}"
    cd ../icons
    for icontheme in */; do
        cp -r "$icontheme" "${dist}/$icontheme"
    done
}
