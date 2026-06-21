# Maintainer: PASRC <pasrc at proton dot me>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>

pkgname=srb2-legacy-data
pkgver=2.1.25
pkgrel=2
pkgdesc="Data files for Sonic Robo Blast 2 2.1 (srb2-legacy specific install directory)"
arch=('any')
license=('custom')
url='https://www.srb2.org'
makedepends=("git-lfs")
source=("git+https://git.do.srb2.org/STJr/srb2assets-public.git#commit=5c9cab509dcc3389cf9bddf55dd168840e62e315")
sha256sums=('96ffdd8899334e0550834d42785d5e86ca95c70461c61464f714f71d32befdf9')

prepare() {
  cd "$srcdir"/srb2assets-public
  git lfs install --local
  git remote add srb2assets-public https://git.do.srb2.org/STJr/srb2assets-public.git
  git lfs pull srb2assets-public
}

package() {
  cd "$srcdir"/srb2assets-public
  install -d "$pkgdir"/usr/share/games/srb2-legacy
  install -m644 {music,player,rings,zones,patch}.dta srb2.srb "$pkgdir"/usr/share/games/srb2-legacy
}
