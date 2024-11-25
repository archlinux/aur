pkgname=startwine
pkgver=407
pkgrel=1
pkgdesc="Is a Windows application launcher for GNU/Linux operating systems. Includes many features, extensions, and fixes to improve performance, visuals, and usability."
arch=('x86_64')
url="https://github.com/RusNor/StartWine-Launcher"
license=('GPL')

depends=('yad' 'fuse' 'curl')

source=(
    "https://github.com/RusNor/StartWine-Launcher/releases/download/StartWine_v$pkgver/StartWine_v$pkgver"
    "StartWine.desktop"
    "StartWine.png"
)

sha256sums=("SKIP" "SKIP" "SKIP")

package() {
    install -Dm755 "StartWine_v$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "StartWine.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "StartWine.png" -t "$pkgdir/usr/share/pixmaps"
}

post_remove() {

    if [ -f "${HOME}/.config/swrc" ]; then
        START_WINE_PATH="$(cat "{$HOME}/.config/swrc")"
        export START_WINE_PATH

        [ -d "${START_WINE_PATH}" ] && \
            rm -rf "${START_WINE_PATH}"

        rm -rf "${HOME}/.config/swrc"

        [ -d "${HOME}/.cache/sw_fm/database" ] && \
            rm -rf "${HOME}/.cache/sw_fm/database"

        [ -d "${HOME}/.cache/sw_fm/downloads" ] && \
            rm -rf "${HOME}/.cache/sw_fm/downloads"

        [ -d "${HOME}/.cache/sw_fm/thumbnail" ] && \
            rm -rf "${HOME}/.cache/sw_fm/thumbnail"

        [ -d "${HOME}/.cache/sw_fm/bookmarks" ] && \
            rm -rf "${HOME}/.cache/sw_fm/bookmarks"

        [ -f "${HOME}/.cache/sw_fm/exe_data.json" ] && \
            rm -rf "${HOME}/.cache/sw_fm/exe_data.json"

        [ -f "${HOME}/.cache/sw_fm/playlist" ] && \
            rm -rf "${HOME}/.cache/sw_fm/playlist"

        [ -f "$HOME/.local/share/applications/StartWine.desktop" ] && \
            rm -rf "$HOME/.local/share/applications/StartWine.desktop"

    fi

}
