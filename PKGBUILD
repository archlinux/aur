pkgname=dyad-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="Free, local, open-source AI app builder | v0 / lovable / Bolt alternative"
arch=('x86_64')
url="https://github.com/dyad-sh/dyad"
license=('Apache')
depends=('libsecret' 'webkit2gtk' 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils')
source=("https://github.com/dyad-sh/dyad/releases/download/v${pkgver}/dyad_${pkgver}_amd64.deb")
sha256sums=('127546c7d7834551e66a1f9c45ded5e6d3c96363e61549af8d2268305b18f0b5')

package() {
  cd "$srcdir"

  ar x "dyad_${pkgver}_amd64.deb"
  for tarball in data.tar.*; do
    bsdtar -xf "$tarball" -C "$pkgdir"
  done

  desktop-file-install --dir="$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/applications/dyad.desktop"
}
