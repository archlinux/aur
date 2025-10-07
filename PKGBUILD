pkgname=dyad-bin
pkgver=0.23.0
pkgrel=1
pkgdesc="Free, local, open-source AI app builder | v0 / lovable / Bolt alternative"
arch=('x86_64')
url="https://github.com/dyad-sh/dyad"
license=('Apache')
depends=('libsecret' 'webkit2gtk' 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils')
source=("https://github.com/dyad-sh/dyad/releases/download/v${pkgver}/dyad_${pkgver}_amd64.deb")
sha256sums=('b0a6b2fe985fbb588d1a4e365f820f231dd522f7c6fa6bc0fbec457c4eff4b3b')

package() {
  cd "$srcdir"

  ar x "dyad_${pkgver}_amd64.deb"
  for tarball in data.tar.*; do
    bsdtar -xf "$tarball" -C "$pkgdir"
  done

  desktop-file-install --dir="$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/applications/dyad.desktop"
}
