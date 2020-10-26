# Maintainer: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>
_pkgname=Juicebox
pkgname=juicebox
pkgver=1.11.08
pkgrel=1
pkgdesc='Visualization and analysis software for Hi-C data'
arch=('any')
url='https://aidenlab.org/juicebox'
license=('MIT')
depends=('java-runtime' 'sh')
makedepends=('gendesk')
source=("https://s3.amazonaws.com/hicfiles.tc4ga.com/public/$_pkgname/${_pkgname}_$pkgver.jar"
        "https://raw.githubusercontent.com/aidenlab/Juicebox/master/LICENSE"
        "$pkgname.sh")
sha512sums=('b763fe3f288e006fdbe06091222cc6dcd768570acb4d354d23464c1bc3bbc5c5aa9b388f1411955c55a93bf646366f3379191f1691cd3b0bf87f2166589e2d1e'
'106869ddab74b937419c54b5a9ba2a4e7dd0bf9d3ddca79dfc746ef73ade5548629ba067bafc7ceb2bf36dcdbec57cc29d1850cb9a360e4a75a8cf8a2afbe1f7'
'daf5d5bc93a6487a86f35577812cacfe1de7052a30d14b4e2e7ba5a4a1f9ef0818f7fe4e932d029170690923ed10f0d74915dec9ff874cad47c55bd5a3945f86')

prepare() {
  gendesk --pkgname="$pkgname" --pkgdesc="$pkgdesc" --categories=Science PKGBUILD
}

package() {
  install -Dm644 "${_pkgname}_$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 'LICENSE'                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname.desktop"        "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$pkgname.sh"             "$pkgdir/usr/bin/$pkgname"
}
