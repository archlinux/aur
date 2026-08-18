# Maintainer: Yubo Cao <cao2006721@gmail.com>
# Contributor: lampese

pkgname=codex-switcher-bin
_pkgname=codex-switcher
pkgver=0.2.11
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
sha256sums=('ef0d115fa6eaff510b17ee0e432154fe2d2474d8b9afe53d9f57f4de83d1cec5')

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
