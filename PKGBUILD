# Maintainer: Antoni Marzec (marzeq) <marzeqmarzeq (at) gmail (dot) com>
_basename="deadlock-modmanager"
_reponame="deadlock-mod-manager"
pkgname="${_basename}-bin"
pkgdesc="A mod manager for the Valve game Deadlock"
pkgver=0.9.2
pkgrel=1
arch=("x86_64")
url="https://github.com/${_reponame}/${_reponame}"
license=("GPL-3.0-or-later")
_filename="${_basename}-${pkgver}.AppImage"
source=("${_filename}::https://github.com/${_reponame}/${_reponame}/releases/download/v${pkgver}/Deadlock.Mod.Manager_${pkgver}_amd64.AppImage")
sha256sums=('ab1f9af508fc27f945404c55030059439a83715084df7fc48b0e19e400260bf0')
provides=("${_basename}")
conflicts=("${_basename}" "${_basename}-git")

build() {
  chmod +x "${_filename}"
  ./"${_filename}" --appimage-extract
}

package() {
  install -Dm755 "squashfs-root/usr/bin/deadlock-mod-manager" \
    "$pkgdir/usr/bin/deadlock-mod-manager"

  install -Dm644 "squashfs-root/usr/share/applications/Deadlock Mod Manager.desktop" \
    "$pkgdir/usr/share/applications/deadlock-mod-manager.desktop"

  for size in 16x16 32x32 64x64 128x128 256x256 256x256@2 scalable; do
    local icon_path="squashfs-root/usr/share/icons/hicolor/${size}/apps/deadlock-mod-manager.png"
    [[ -f "$icon_path" ]] || continue
    install -Dm644 "$icon_path" "$pkgdir/usr/share/icons/hicolor/${size}/apps/deadlock-mod-manager.png"
  done
}
