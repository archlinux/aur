# Maintainer: Yubo Cao <cao2006721@gmail.com>
# Contributor: lampese

pkgname=codex-switcher-bin
_pkgname=codex-switcher
pkgver=0.2.24
pkgrel=2
pkgdesc='A multi-account manager for OpenAI Codex CLI'
arch=('x86_64')
url='https://github.com/Lampese/codex-switcher'
license=('MIT')
# Upstream's .deb is built on Ubuntu against OpenSSL 3 (libssl.so.3); Arch's
# openssl is 4.x, so the 3.x ABI comes from the openssl-3 compat package.
depends=('webkit2gtk-4.1' 'gtk3' 'openssl-3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip')
source=("${_pkgname}-${pkgver}.deb::https://github.com/Lampese/codex-switcher/releases/download/v${pkgver}/Codex.Switcher_${pkgver}_amd64.deb"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/Lampese/codex-switcher/v${pkgver}/LICENSE")
sha256sums=('07d6bba0da799699e169dba3035508008ea0a2e7ff19aa167a9fab54a0f8993d'
            '538d73a8b1861422ad06eccfd5dc9677907f4aeee419eccb8eec13643d3f6abd')

package() {
    cd "$srcdir"
    ar x "${_pkgname}-${pkgver}.deb" data.tar.gz
    tar xzf data.tar.gz -C "$pkgdir"

    # Fix desktop file name (upstream uses space in filename)
    if [ -f "$pkgdir/usr/share/applications/Codex Switcher.desktop" ]; then
        mv "$pkgdir/usr/share/applications/Codex Switcher.desktop" \
           "$pkgdir/usr/share/applications/codex-switcher.desktop"
    fi

    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
