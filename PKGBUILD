pkgname=fcitx5-theme-pt-cute-light
pkgver=r4.7cd3c7f
pkgrel=1
pkgdesc="Cute light themes for fcitx5 (Kagami, Konata, Minami, Misao) - horizontal candidate mode"
arch=('any')
url="https://github.com/Passthem-desu/fcitx5-theme-pt-cute-light"
license=('unknown')
depends=('fcitx5')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"

    local _themesdir="${pkgdir}/usr/share/fcitx5/themes"

    for _theme in kagami konata minami misao; do
        find "${_theme}" -type f | while read -r _file; do
            install -Dm644 "${_file}" "${_themesdir}/${_file}"
        done
    done

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 Licence "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

