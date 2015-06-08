# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Alexandre G <alex foo lecairn bar org>

pkgname=figtree
pkgver=1.4.2
pkgrel=2
pkgdesc='Graphical viewer of phylogenetic trees'
arch=('any')
url='http://tree.bio.ed.ac.uk/software/figtree'
license=('GPL2')  # as stated in http://code.google.com/p/figtree/
depends=('java-environment')
source=("$pkgname-$pkgver.tar.gz::http://tree.bio.ed.ac.uk/download.php?id=90&num=3"
        "${pkgname}.patch"
        "${pkgname}.desktop")
sha256sums=('5064509fbe8cf069c6b0f8fdacf8c3f651971b11956484ce98a18a114ce1a096'
            '8387f23770fed27566b01c9cf1b95f958cade55a90d63916bf7edee383c33321'
            '93aaadf4db141c57c5a84fe6e9e875af5091c9fe468f41adb8ce6c02ed214ab3')

prepare() {
  patch -p1 -i "${srcdir}/${pkgname}.patch" "${srcdir}/FigTree_v${pkgver}/bin/figtree"
}

package() {
  _figdir="${srcdir}/FigTree_v${pkgver}"
  
  install -Dm755 "${_figdir}/bin/figtree" "${pkgdir}/usr/bin/figtree"
  install -Dm755 "${_figdir}/lib/figtree.jar" "${pkgdir}/usr/share/figtree/lib/figtree.jar"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${_figdir}/images/figtree.png" "${pkgdir}/usr/share/pixmaps/figtree.png"
  
  # Install doc and examples
  install -Dm644 "${_figdir}/README.txt"     "${pkgdir}/usr/share/doc/figtree/README.txt"
  install -Dm644 "${_figdir}/carnivore.tree" "${pkgdir}/usr/share/doc/figtree/examples/carnivore.tree"
  install -Dm644 "${_figdir}/influenza.tree" "${pkgdir}/usr/share/doc/figtree/examples/influenza.tree"
}
