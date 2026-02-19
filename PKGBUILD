# Maintainer: coxackie

pkgname=wljs-notebook-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="WLJS Notebook – interactive notebook for Wolfram Language / Wolfram Engine"
arch=('x86_64')
url="https://wljs.io"
license=('GPL-3')
depends=('wolframengine')
provides=('wljs-notebook')
source=("https://github.com/JerryI/wolfram-js-frontend/releases/download/v${pkgver}/wljs-notebook-${pkgver}-amd64-gnulinux.deb")
sha256sums=('b7b6aa0b537fc1599e355640570f0e0f91a3af242ea02283e20a95d205fc75b8')

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

