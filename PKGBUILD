# Maintainer: coxackie

pkgname=wljs-notebook-bin
pkgver=2.8.7
pkgrel=1
pkgdesc="WLJS Notebook – interactive notebook for Wolfram Language / Wolfram Engine"
arch=('x86_64')
url="https://wljs.io"
license=('GPL-3')
depends=('wolframengine')
provides=('wljs-notebook')
source=("https://github.com/JerryI/wolfram-js-frontend/releases/download/v${pkgver}/wljs-notebook-${pkgver}-amd64-gnulinux.deb")
sha256sums=('f8fcf0c4a3efcb44e803bad9044f67988456a67d2151cc1de4f30728907ced22')

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

