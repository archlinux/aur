# Maintainer: Eduardo Parra <eduparra90@gmail.com>
pkgname=github-copilot-app-bin
_pkgname=github-copilot-app
pkgver=1.0.15
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

sha256sums_x86_64=('df4177c8844ddc19fef5371da7389abeedab0a1b8e3b4439a32e84e54bb6e93a')
sha256sums_aarch64=('106c2e2140dabcb324a90839649c2f3bb224c88deefc6995beb4a82dd12baa0c')

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
