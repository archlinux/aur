# Maintainer: Hugo Mayonobe <hugomyb@users.noreply.github.com>
pkgname=lume-bin
pkgver=1.5.1
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
sha256sums=('44b16f3120f0459d4511930139bcf04afc7922224d8f9e463f544960d5347357'
            'SKIP')

package() {
  # A .deb is an `ar` archive holding data.tar.* with the installed tree.
  bsdtar -xf "Lume_${pkgver}_amd64.deb" -C "$srcdir"
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
