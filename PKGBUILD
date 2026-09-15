# Maintainer: Hugo Mayonobe <hugomyb@users.noreply.github.com>
pkgname=lume-bin
pkgver=1.2.0
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
sha256sums=('31ef0acece89b8d2a1faf89fc87cc896d96e4f673df4551dcaa595ff7df5c542'
            'SKIP')

package() {
  # A .deb is an `ar` archive holding data.tar.* with the installed tree.
  bsdtar -xf "Lume_${pkgver}_amd64.deb" -C "$srcdir"
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
