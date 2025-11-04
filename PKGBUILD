# Maintainer: coxackie

pkgname=wljs-notebook-bin
pkgver=2.8.8
pkgrel=1
pkgdesc="WLJS Notebook – interactive notebook for Wolfram Language / Wolfram Engine"
arch=('x86_64')
url="https://wljs.io"
license=('GPL-3')
depends=('wolframengine')
provides=('wljs-notebook')
source=("https://github.com/JerryI/wolfram-js-frontend/releases/download/v${pkgver}/wljs-notebook-${pkgver}-amd64-gnulinux.deb")
sha256sums=('defd6cbf39a8a74c02cd4a0c61dbefea5fe77597938114a5ddcb9facd2a56cdc')

noextract=('*.deb')

build() {
  # nothing to compile; binary package
  return 0
}

package() {
  cd "$srcdir"

  # extract the Debian package
  ar x "wljs-notebook-${pkgver}-amd64-gnulinux.deb"
  tar -xf data.tar.* -C "$pkgdir"/

  # remove Debian metadata
  rm -rf "$pkgdir/DEBIAN"

  # enforce correct permissions
  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir" -type f -exec chmod 644 {} \;

  # mark the main binary executable (adjust path if different)
  if [[ -f "$pkgdir/opt/WLJS Notebook/wljs-notebook" ]]; then
    chmod +x "$pkgdir/opt/WLJS Notebook/wljs-notebook"
  fi
}

