# Maintainer: Frederik Nordahl Jul Sabroe <frederikns at gmail dot com>
# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: adament <adament@adament.net>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=hunspell-da
pkgver=2.7.273
pkgrel=1
pkgdesc="Danish hunspell dictionaries"
arch=('any')
url="https://stavekontrolden.dk/"
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=("https://stavekontrolden.dk/dictionaries/da_DK/da_DK-$pkgver.aff"
        "https://stavekontrolden.dk/dictionaries/da_DK/da_DK-$pkgver.dic")
b2sums=('a7bd3f6635671780753d66a0fd3f7ecb4a2804283ba18343af21ef3076071a342f2f1f20c043b0f3908548d659dc42bbb20b93fa12758e4f7842f95643df5f8b'
        '49b978e9c5cebd84909640b1781cc0e50d06002b8337842dfd9242c8aa3b5c24a025c6a0323de640e0804928e7109477c91e9689564f8b10f303f3d03ec07e52')

build() {
  # Rename downloaded files
  for file in "${source[@]}"; do
    mv $(basename $file) $(basename ${file/+([\.-]+([0-9]))/})
  done
}

package() {
  install -dm755 "${pkgdir}"/usr/share/hunspell
  install -m644 da_DK.dic da_DK.aff $pkgdir/usr/share/hunspell

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd "$pkgdir"/usr/share/myspell/dicts
  for file in $pkgdir/usr/share/hunspell/*; do
    ln -sv /usr/share/hunspell/"$(basename $file)" .
  done
  popd
}
