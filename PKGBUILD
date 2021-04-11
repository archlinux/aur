# Maintaoner: Yamada Hayao <hayao@fascode.net>

remove () {
    local _list
    local _file
    _list=($(echo "$@"))
    for _file in "${_list[@]}"; do
        if [[ -f ${_file} ]]; then
            rm -f "${_file}"
        elif [[ -d ${_file} ]]; then
            rm -rf "${_file}"
        fi
    done
}
_pkgname=(
    "alterlinux-live-tools"
    "alterlinux-gtk-bookmarks"
    "alterlinux-welcome-page"
    "alterlinux-plasma-bookmarks"
    "alterlinux-desktop-file"
    "alterlinux-live-info"
)

pkgname=(${_pkgname[@]})
_reponame="fascode-live-tools"
pkgver="1.6.2"
pkgrel="1"
pkgdesc="Scripts required for live environment"
arch=('any')
url="https://github.com/FascodeNet/${_reponame}"
license=('SUSHI-WARE')
depends=(
    "xdg-user-dirs"
    "bash"
)
md5sums=("2778b1b2d4ee7b165323d4288d54950f")
source=("${url}/archive/v${pkgver}.zip")

extracted="${_reponame}-${pkgver}"
#extracted="${_reponame}"

install_files() {
    _pkgname="${pkgname}"
    cd "${srcdir}/${extracted}/${_pkgname}"
    install -m 755 -D "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

install_license() {
    _pkgname="${pkgname}"
    cd "${srcdir}/${extracted}/"
    install -m 755 -D "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}


# alterlinux-live-tools
package_alterlinux-live-tools() {
    pkgdesc="Scripts required for live environment (meta package)"
    conflicts=('alterlinux-live-tools')
    provides=("alterlinux-live-tools")

    depends+=(${_pkgname[@]})


    install_license
}

# alterlinux-gtk-bookmarks
package_alterlinux-gtk-bookmarks() {
    pkgdesc="Simple script to automatically generate GTK bookmarks"
    install_files
    install_license
}

# alterlinux-welcome-page
package_alterlinux-welcome-page() {
    pkgdesc="A simple script to open the official AlterLinux website"
    optdepends=(
            'chromium: To open the page'
            'google-chrome: To open the page'
            'firefox: To open the page'
    )

    install_files
    install_license
}

# alterlinux-plasma-bookmarks
package_alterlinux-plasma-bookmarks() {
    pkgdesc="Simple script to automatically generate Plasma bookmarks"
    install_files
    install_license
}

# alterlinux-desktop-file
package_alterlinux-desktop-file() {
    pkgdesc="Place the Calamares icon on your desktop"
    depends+=("glib2")
    install_files

    cd "${srcdir}/${extracted}/"
    install -m 755 -D "${srcdir}/${extracted}/${pkgname}/calamares.desktop" "${pkgdir}/usr/share/alterlinux/desktop-file/calamares.desktop"
    install -m 755 -D "${srcdir}/${extracted}/${pkgname}/welcome-to-alter.desktop" "${pkgdir}/usr/share/alterlinux/desktop-file/welcome-to-alter.desktop"

    install_license
}

# alterlinux-live-info
package_alterlinux-live-info() {
    pkgdesc="Display version information of live environment"
    install_files
    install_license
}
