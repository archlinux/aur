# Maintainer: FreehuntX freehuntx at web dot de
pkgbase=godot-next-bin
pkgname=('godot-next-bin' 'godot-next-mono-bin')
pkgver=4.7beta1
pkgrel=1
pkgdesc="Godot Engine Next - Prebuilt binary from GitHub"
arch=('x86_64')
url="https://godotengine.org"
license=('MIT')
depends=('glibc')

_pkgver_url="4.7-beta1"
_filename_std="Godot_v${_pkgver_url}_linux.x86_64.zip"
_filename_mono="Godot_v${_pkgver_url}_mono_linux_x86_64.zip"

source=("https://github.com/godotengine/godot-builds/releases/download/${_pkgver_url}/${_filename_std}"
        "https://github.com/godotengine/godot-builds/releases/download/${_pkgver_url}/${_filename_mono}"
        "godot-next.desktop"
        "godot-next-mono.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
noextract=("${_filename_std}" "${_filename_mono}")

package_godot-next-bin() {
    pkgdesc="Godot Engine Next - Prebuilt binary from GitHub"
    provides=("godot-next=${pkgver}")
    conflicts=('godot-next')
    
    install -dm755 "$pkgdir/opt/godot-next"
    bsdtar -xf "${_filename_std}" -C "$pkgdir/opt/godot-next"
    
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/godot-next/Godot_v${_pkgver_url}_linux.x86_64" "$pkgdir/usr/bin/godot-next"

    install -Dm644 "$srcdir/godot-next.desktop" "$pkgdir/usr/share/applications/godot-next.desktop"
}

package_godot-next-mono-bin() {
    pkgdesc="Godot Engine Next (Mono) - Prebuilt binary from GitHub"
    provides=("godot-next-mono=${pkgver}")
    conflicts=('godot-next-mono')
    
    install -dm755 "$pkgdir/opt/godot-next-mono"
    
    bsdtar -xf "${_filename_mono}" -C "$pkgdir/opt/godot-next-mono"
    
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/godot-next-mono/Godot_v${_pkgver_url}_mono_linux_x86_64/Godot_v${_pkgver_url}_mono_linux.x86_64" "$pkgdir/usr/bin/godot-next-mono"

    install -Dm644 "$srcdir/godot-next-mono.desktop" "$pkgdir/usr/share/applications/godot-next-mono.desktop"
}
