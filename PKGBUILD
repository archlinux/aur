# Maintainer: Noel <cutie@floofy.dev>

pkgname=bitwarden-desktop
pkgrel=1
pkgver=2022.10.1
pkgdesc="Open source password management solutions for individuals, teams, and business organizations."
license=("GPL")
arch=('x86_64')
source=("https://github.com/bitwarden/clients/releases/download/desktop-v${pkgver}/Bitwarden-${pkgver}-amd64.deb")
url='https://bitwarden.com'
sha256sums=('903b5cab3986276e8cb2f72b7033cea735b317144471a4b585dcdae56153e58d')

build() {
  sed -i -E \
    "s|Exec=/opt/Bitwarden/bitwarden|Exec=/opt/bitwarden/bitwarden|" \
    "$srcdir/dist/usr/share/applications/bitwarden.desktop"
}

prepare() {
  install -d "$srcdir"/dist
  tar -xf "$srcdir"/data.tar.xz -C "$srcdir/dist"
}

package() {
  install -d "$pkgdir"/opt/bitwarden

  # Move everything from /opt/Bitwarden to /opt/bitwarden
  cp -arT "$srcdir/dist/opt/Bitwarden" "$pkgdir/opt/bitwarden"
  install -d "$pkgdir"/usr/{bin,lib,share/{pixmaps,icons,applications}}
  cp -a "$srcdir/dist/usr/share/icons" "$pkgdir/usr/share/icons" 
  install -Dm644 "$srcdir/dist/usr/share/applications/bitwarden.desktop" "$pkgdir/usr/share/applications/bitwarden.desktop"
}
