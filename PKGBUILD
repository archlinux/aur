# Maintaoner: Yamada Hayao <hayao@fascode.net>

remove () {
    rm -rf "${@}"
}
_pkgname=(
    "alterlinux-live-tools"
    "fascode-gtk-bookmarks"
    "alterlinux-welcome-page"
    "alterlinux-plasma-bookmarks"
    "alterlinux-desktop-file"
    "alterlinux-live-info"
    "alterlinux-gtk-bookmarks"
)

pkgname=(${_pkgname[@]})
_reponame="fascode-live-tools"
pkgver="1.8.1"
pkgrel="3"
pkgdesc="Scripts required for live environment"
arch=('any')
url="https://github.com/FascodeNet/${_reponame}"
license=('SUSHI-WARE')
depends=(
    "xdg-user-dirs"
    "bash"
)
md5sums=("9a8c5cb5b3e4ab0c213aec0049b3fe59")
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
    depends+=("${_pkgname[@]}")
    install_license
}

# alterlinux-gtk-bookmarks
package_fascode-gtk-bookmarks() {
    pkgdesc="Simple script to automatically generate GTK bookmarks"
    replaces+=("alterlinux-gtk-bookmarks")
    provides+=("alterlinux-gtk-bookmarks")
    install_files
    install_license
}

package_alterlinux-gtk-bookmarks(){
    pkgdesc="Simple script to automatically generate GTK bookmarks"
    depends=("fascode-gtk-bookmarks")
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/usr/bin/fascode-gtk-bookmarks" "${pkgdir}/usr/bin/alterlinux-gtk-bookmarks"
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
