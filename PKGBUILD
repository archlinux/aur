# Maintainer: mdmrk <mariodavo.20@gmail.com>

pkgname=shadps4-qtlauncher-nightly-bin
_pkgname=shadPS4QtLauncher
_pkgid=net.shadps4.shadPS4QtLauncher
pkgver=2025.10.14.db9921b
_date=2025-10-14
_commit=db9921baf2e345fed15e6cbb95731088c5fbddf2
_shortcommit=db9921b
pkgrel=1
pkgdesc="Nightly release of the shadPS4QtLauncher PlayStation 4 emulator launcher"
arch=('x86_64')
url="https://shadps4.net/"
license=('GPL-2.0-only')
options=('!strip')
provides=('shadps4-qtlauncher')
conflicts=('shadps4-qtlauncher')
_appimage=shadPS4QtLauncher-qt.AppImage
source=("shadps4-qtlauncher-linux-qt-${_date}-${_shortcommit}.zip::https://github.com/mdmrk/shadps4-qtlauncher-nightly-bin/releases/download/v2025.10.14.db9921b/shadps4-qtlauncher-linux-qt-2025-10-14-db9921b.zip")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
    sed -i "s|this_dir=\"\$(readlink -f \"\$(dirname \"\$0\")\")\"|this_dir=\"/opt/${_pkgname}\"|" "$srcdir/squashfs-root/AppRun"
}

package() {
    install -dm755 "$pkgdir/opt/${_pkgname}"
    mv "$srcdir"/squashfs-root/* "$pkgdir/opt/${_pkgname}"
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/${_pkgname}/AppRun" "$pkgdir/usr/bin/shadps4-qtlauncher"
    install -Dm644 "$pkgdir/opt/${_pkgname}/${_pkgid}.svg" -t "$pkgdir/usr/share/pixmaps"
    install -Dm644 "$pkgdir/opt/${_pkgname}/${_pkgid}.desktop" -t "$pkgdir/usr/share/applications"
    chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
