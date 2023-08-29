# Maintainer: Frederik Nordahl Jul Sabroe <frederikns at gmail dot com>
# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: adament <adament@adament.net>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=hunspell-da
pkgver=2.7.268
pkgrel=1
pkgdesc="Danish hunspell dictionaries"
arch=('any')
url="https://stavekontrolden.dk/"
license=('GPL2' 'LGPL2.1' 'MPL')
optdepends=('hunspell: the spell checking libraries and apps')
source=("https://stavekontrolden.dk/dictionaries/da_DK/da_DK-$pkgver.aff"
        "https://stavekontrolden.dk/dictionaries/da_DK/da_DK-$pkgver.dic")
b2sums=('57ac5d15703094cba13f7307ee711b894fa6ae4ca968aa35a9c40fbf4c6ad3993f3e3c1ef9ea4111bd03613c428e54384e557709aafa5385eb7eae7655d9dc45'
        '0ace25b785fd334b64b1451529b8d1e103c892b71c150c33117e6ad9f3ea60d64b5fc72f0fc1d21b1969d3952b5d3cfebefed3efa76d1d193855ed41f84f3312')

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
