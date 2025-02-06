pkgname=amphi-notes
pkgver=1.0.0
pkgrel=1
pkgdesc='A note-taking app created by Amphi'
url=https://amphi.site
arch=('x86_64' 'aarch64')
license=(APACHE)
depends=(fuse2 mpv mimalloc)
options=(!debug)
source_x86_64=("${url}/releases/notes/linux/x86/deb/notes-linux-x86-1.0.0.deb")
sha256sums_x86_64=("f3b22a7e785d706e041118e4029d0ba43cf143e39a773b97bf41c0ef2a40a601")
_pkgdesktop="amphi-notes.desktop"


prepare() {
        if [[ -f data.tar.xz ]]; then
        tar -xf data.tar.xz
        elif [[ -f data.tar.zst ]]; then
        tar --zstd -xf data.tar.zst
        else
        echo "Error: data.tar.xz or data.tar.zst not found!"
        exit 1
        fi
}
        
package() {
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgdesktop}" "${pkgdir}/usr/share/applications/${_pkgdesktop}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/amphi/notes.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/amphi/notes.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/amphi/notes.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/amphi/notes.png"
    
    mkdir -p "${pkgdir}/usr/share/amphi/notes"
    
    cp -rp "${srcdir}/usr/share/amphi/notes"* "${pkgdir}/usr/share/amphi/"
    find "${pkgdir}/usr/share/amphi/notes" -type f -exec chmod 644 {} +
    find "${pkgdir}/usr/share/amphi/notes" -type d -exec chmod 755 {} +
    chmod 755 "${pkgdir}/usr/share/amphi/notes/notes"
}