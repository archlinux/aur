# Maintainer: Hugo Mayonobe <hugomyb@users.noreply.github.com>
pkgname=lume-bin
pkgver=1.0.11
pkgrel=1
pkgdesc="Fast, lightweight, open-source terminal — a private, local alternative to Warp"
arch=('x86_64')
url="https://github.com/hugomyb/Lume"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=('cloudflared: remote control over the internet (cross-network)')
provides=('lume')
conflicts=('lume')
options=('!strip')
source=("Lume_${pkgver}_amd64.deb::https://github.com/hugomyb/Lume/releases/download/v${pkgver}/Lume_${pkgver}_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/hugomyb/Lume/v${pkgver}/LICENSE")
sha256sums=('0d1699d7b91cd87b3dbda08bef717de45ec8c87ac0a1f8ee3262c9813d2de6c6'
            'SKIP')

package() {
  # A .deb is an `ar` archive holding data.tar.* with the installed tree.
  bsdtar -xf "Lume_${pkgver}_amd64.deb" -C "$srcdir"
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
