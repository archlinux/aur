# Maintainer: Eduardo Parra <eduparra90@gmail.com>
pkgname=github-copilot-app-bin
_pkgname=github-copilot-app
pkgver=1.1.15
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

sha256sums_x86_64=('cf884fd0b9e5418285e82318c4fe712d74955f66982bae6a5d5c43aa1f44233e')
sha256sums_aarch64=('587445c4ad98917638204f6a66f15b1868b8795b317725cbed37fc635df07e10')

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
