# Maintainer: Yubo Cao <cao2006721@gmail.com>
# Contributor: lampese

pkgname=codex-switcher-bin
_pkgname=codex-switcher
pkgver=0.2.2
pkgrel=1
pkgdesc='A multi-account manager for OpenAI Codex CLI'
arch=('x86_64')
url='https://github.com/Lampese/codex-switcher'
license=('unknown')
depends=('webkit2gtk-4.1' 'gtk3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!strip')
source=("${_pkgname}-${pkgver}.deb::https://github.com/Lampese/codex-switcher/releases/download/v${pkgver}/Codex.Switcher_${pkgver}_amd64.deb")
sha256sums=('be1f60911eb7b94dfd94049e2003c4a95e80041b849c63b37f1fdd3d29d98466')

package() {
    cd "$srcdir"
    ar x "${_pkgname}-${pkgver}.deb" data.tar.gz
    tar xzf data.tar.gz -C "$pkgdir"

    # Fix desktop file name (upstream uses space in filename)
    if [ -f "$pkgdir/usr/share/applications/Codex Switcher.desktop" ]; then
        mv "$pkgdir/usr/share/applications/Codex Switcher.desktop" \
           "$pkgdir/usr/share/applications/codex-switcher.desktop"
    fi
}
