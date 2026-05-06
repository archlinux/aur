# Maintainer: Alejandro Garcia <albiol2004@gmail.com>
pkgname=athen-bin
_pkgname=athen
pkgver=0.1.1
pkgrel=1
pkgdesc="Universal proactive AI agent (Tauri 2 desktop app)"
arch=('x86_64')
url="https://github.com/albiol2004/Athen"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libsoup3'
    'libappindicator-gtk3'
    'glib2'
    'glibc'
    'libgcc'
    'hicolor-icon-theme'
)
optdepends=(
    'podman: container-isolated tool sandbox'
    'docker: container-isolated tool sandbox (alternative to podman)'
    'nushell: cross-platform shell backend'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug')
source=(
    "$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/Athen_${pkgver}_amd64.deb"
    "LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
)
sha256sums=(
    'c5df77c52b0c0d2f05f208225a0823ddc746f639f46d9c3f6de71f6a94a683ea'
    '63a6a7e9ff02a7d4782645d17fb75d5d918dc35c834a64dab5db485da85feb47'
)

package() {
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir/" 2>/dev/null \
        || tar -xf "$srcdir/data.tar.gz" -C "$pkgdir/"

    install -Dm644 "$srcdir/LICENSE-$pkgver" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
