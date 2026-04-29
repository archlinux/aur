# Maintainer: Jose <josrebe333@gmail.com>
pkgname=bookos-settings
pkgver=0.4.0
pkgrel=1
pkgdesc="BookOS Settings — settings application for KDE Plasma (Samsung Galaxy Book / BookOS)"
arch=('x86_64')
url="https://github.com/Evelynx08/BookOS-Settings"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3')
optdepends=(
    'colord: ICC profile support'
    'kscreen: display control via kscreen-doctor'
    'qdbus6: brightness control via KDE D-Bus'
    'python: local semantic search'
    'inotify-tools: watcher for semantic search'
    'python-dbus: KRunner semantic search plugin'
    'python-gobject: KRunner semantic search plugin'
)

# Pre-built binary package published as a GitHub Release asset.
# We unpack it and reinstall its contents into $pkgdir — no compilation step.
source=("${pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('b17689ed3b52eb089c1e1da986306b1b0a8aee42bda02348d2e7542afa2b7d7c')
noextract=("${pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")

package() {
    cd "$srcdir"

    # Extract the upstream pre-built package into a staging dir
    install -dm755 _stage
    bsdtar -xf "${pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst" -C _stage

    # Reinstall its tree into $pkgdir, dropping pacman metadata files
    install -dm755 "$pkgdir"
    cp -a _stage/opt _stage/usr "$pkgdir/"
}
