# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Alexandre G <alex foo lecairn bar org>

pkgname=figtree-bin
_pkgname=figtree
pkgver=1.4.4
pkgrel=2
pkgdesc='Graphical viewer of phylogenetic trees'
arch=('any')
url='http://tree.bio.ed.ac.uk/software/figtree'
license=('GPL-2.0-or-later')
depends=('java-runtime')
conflicts=('figtree')
provides=('figtree')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/rambaut/$_pkgname/releases/download/v$pkgver/FigTree_v$pkgver.tgz"
        "fix_jar_path.patch"
        "${_pkgname}.desktop")
sha256sums=('529b867657b29e369cf81cd361e6a76bd713d488a63b91932df2385800423aa8'
            'f2aa0ebe18924d098f0380d7a5dba3d154c4049c53749be19ab12d77f2c7fccb'
            '93aaadf4db141c57c5a84fe6e9e875af5091c9fe468f41adb8ce6c02ed214ab3')

prepare() {
  patch -p1 -i "${srcdir}/fix_jar_path.patch" "${srcdir}/FigTree_v${pkgver}/bin/figtree"
}

package() {
  _figdir="${srcdir}/FigTree_v${pkgver}"

  install -Dm755 "${_figdir}/bin/figtree" "${pkgdir}/usr/bin/figtree"
  install -Dm755 "${_figdir}/lib/figtree.jar" "${pkgdir}/usr/share/figtree/lib/figtree.jar"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_figdir}/images/figtree.png" "${pkgdir}/usr/share/pixmaps/figtree.png"

  # Install doc and examples
  install -Dm644 "${_figdir}/README.txt"     "${pkgdir}/usr/share/doc/figtree/README.txt"
  install -Dm644 "${_figdir}/carnivore.tree" "${pkgdir}/usr/share/doc/figtree/examples/carnivore.tree"
  install -Dm644 "${_figdir}/influenza.tree" "${pkgdir}/usr/share/doc/figtree/examples/influenza.tree"
}
