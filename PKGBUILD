# Maintainer: coxackie

pkgname=wljs-notebook-bin
pkgver=2.9.1
pkgrel=1
pkgdesc="WLJS Notebook – interactive notebook for Wolfram Language / Wolfram Engine"
arch=('x86_64')
url="https://wljs.io"
license=('GPL-3')
depends=('wolframengine')
provides=('wljs-notebook')
source=("https://github.com/JerryI/wolfram-js-frontend/releases/download/v${pkgver}/wljs-notebook-${pkgver}-amd64-gnulinux.deb")
sha256sums=('e1c6876beabd4f2da288e335e257ad411e74db1b58bfdaf5c53e7b17ab42f985')

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
  if [[ -f "$pkgdir/opt/WLJS Notebook/wljs-notebook" ]]; then
    chmod +x "$pkgdir/opt/WLJS Notebook/wljs-notebook"
  fi
}

