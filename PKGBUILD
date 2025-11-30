# Maintainer: Filth <filth [at] wagn [dot] me>

_pkgname=adastra
pkgname="${_pkgname}-bin"
pkgver=17
pkgrel=1
pkgdesc="An 18+ romance visual novel with a whole bunch of sci-fi and political intrigue mixed in. (bundled Ren'Py)"
arch=('x86_64' 'i686')
options=("!strip" "!debug")
url="https://echoproject.itch.io/adastra"
depends=('bash')
makedepends=('itchio-dlagent')
license=('custom')
source=("${_pkgname}.desktop"
        "$_pkgname.sh"
        "Adastra-${pkgver}-linux.tar.bz2::itch://echoproject/adastra/2364968")
b2sums=('de1b2f5134d09dd2cde851c075eb1fb5ce3dab478a1e3fcf2a6a48179901827171703c77d5941ebbedaa001d3c285dd60412e6d0128eef73219e63939cf408f7'
        '03b5c8ffcb29602b6715fdf22e96ec016776777b5eb003de2f0c2af3ba7dcffa41596428093ff646cc8284a057125bcf85bae45de567dce254c6ac6e6f838f20'
        '2aa130be087787ab21dc2d20f83b6fa080b461e41b0f5dc2c0a563ba72747840ae41df6ce459b59a72a22c86d509d1016da94652d6529e544f18a53fef936e22')
DLAGENTS+=("itch::/usr/bin/itchio-dlagent %u %o")

package() {
  # Remove unnecessary files
  if [[ "$CARCH" == "x86_64" ]]; then
    rm -rf "Adastra-$pkgver-linux/lib/linux-i686"
  elif [[ "$CARCH" == "i686" ]]; then
    rm -rf "Adastra-$pkgver-linux/lib/linux-x86_64"
  fi

  # Install Data
  install -dm755 "$pkgdir/usr/share/$_pkgname"
  cp -r Adastra-$pkgver-linux/* "$pkgdir/usr/share/$_pkgname"

  # Install Launcher
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  # Install Desktop
  install -Dm644 Adastra-"$pkgver"-linux/game/gui/window_icon.png "$pkgdir"/usr/share/pixmaps/"$_pkgname".png
  install -Dm644 "$_pkgname".desktop "$pkgdir"/usr/share/applications/adastra.desktop
}