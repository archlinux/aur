# Maintainer: PASRC <pasrc at proton dot me>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>

pkgname=srb2-legacy-data
pkgver=2.1.30
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2 2.1 (srb2-legacy specific install directory)"
arch=('any')
license=('custom')
url='https://codeberg.org/srb2-preservation/assets'
makedepends=('git' 'git-lfs')
source=("git+https://codeberg.org/srb2-preservation/assets.git#commit=1af2863f5755481c672b7a3a35ccd2133cc80b89")
sha256sums=('888ae746201e48951c28a00de5bb617e8d4460135c932a467e53f1b69041ce3a')

prepare() {
  cd "$srcdir"/assets
  # the clone's origin is makepkg's local mirror, which has no LFS objects
  git config lfs.url https://codeberg.org/srb2-preservation/assets.git/info/lfs
  git lfs install --local
  git lfs pull
}

package() {
  cd "$srcdir"/assets
  install -d "$pkgdir"/usr/share/games/srb2-legacy
  install -m644 {music,player,rings,zones,patch}.dta srb2.srb legacy.pk3 "$pkgdir"/usr/share/games/srb2-legacy
}
