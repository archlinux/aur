# Maintainer: coxackie

pkgname=wljs-notebook-bin
pkgver=3.1.3
pkgrel=1
pkgdesc="WLJS Notebook – interactive notebook for Wolfram Language / Wolfram Engine"
arch=('x86_64')
url="https://wljs.io"
license=('GPL-3')
depends=('wolframengine')
provides=('wljs-notebook')
source=("https://github.com/JerryI/wolfram-js-frontend/releases/download/v${pkgver}/wljs-notebook-${pkgver}-amd64-gnulinux.deb")
sha256sums=('7c4cec8b9bf0c6dbf3a8d7fa2ba12e975fb9b65bbee3e4a141f54327f2b5efac')

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

  # mark the main binary executable
  if [[ -f "$pkgdir/opt/wljs-notebook/wljs-notebook" ]]; then
    chmod +x "$pkgdir/opt/wljs-notebook/wljs-notebook"
  fi
}

