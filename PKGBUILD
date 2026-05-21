# Maintainer: Eduardo Parra <eduparra90@gmail.com>
pkgname=github-copilot-app-bin
_pkgname=github-copilot-app
pkgver=0.2.7
pkgrel=1
pkgdesc="GitHub Copilot desktop application (Tauri)"
arch=('x86_64' 'aarch64')
url="https://github.com/github/app"
license=('LicenseRef-proprietary')
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=(
    'libayatana-appindicator: system tray icon support'
    'git: required for repository operations from the app'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!emptydirs')

source_x86_64=("$pkgname-$pkgver-x64.deb::$url/releases/download/v$pkgver/GitHub-Copilot-linux-x64.deb")
source_aarch64=("$pkgname-$pkgver-arm64.deb::$url/releases/download/v$pkgver/GitHub-Copilot-linux-arm64.deb")

sha256sums_x86_64=('e560ddfcd332c6baf127ef0f2967a154113c93aa69cb4d29f3d613df752de729')
sha256sums_aarch64=('252b4fbf2e62199c36708da78d14ce6b7c65384682fc8dba0b549d514b55fb6d')

package() {
    local _deb
    case "$CARCH" in
        x86_64)  _deb="$pkgname-$pkgver-x64.deb" ;;
        aarch64) _deb="$pkgname-$pkgver-arm64.deb" ;;
    esac

    # Extract data archive out of the .deb (ar format), then unpack into pkgdir.
    bsdtar -xf "$srcdir/$_deb" -C "$srcdir" data.tar.zst
    bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"
}
