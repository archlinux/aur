# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Alexandre G <alex foo lecairn bar org>

pkgname=figtree
pkgver=1.4.3
pkgrel=1
pkgdesc='Graphical viewer of phylogenetic trees'
arch=('any')
url='http://tree.bio.ed.ac.uk/software/figtree'
license=('GPL2')  # as stated in http://code.google.com/p/figtree/
depends=('java-environment')
source=("$pkgname-$pkgver.tar.gz::http://tree.bio.ed.ac.uk/download.php?id=96&num=3"
        "${pkgname}.patch"
        "${pkgname}.desktop")
sha256sums=('f497d4dd3a6d220f6b62495b6f47a12ade50d87dbd8d6089f168e94d202f937b'
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
