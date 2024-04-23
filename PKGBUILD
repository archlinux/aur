# Maintainer: Frederik Nordahl Jul Sabroe <frederikns at gmail dot com>
# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: adament <adament@adament.net>
# Contributor: Jamie Magee <jamie dot magee at gmail dot com>
pkgname=hunspell-da
pkgver=2.8.098
pkgrel=1
pkgdesc="Danish hunspell dictionaries"
arch=('any')
url='https://stavekontrolden.dk/'
license=('GPL-3.0-only AND (GPL-2.0-only AND LGPL-2.1-only AND MPL-1.1)')
optdepends=(
  'hunspell: the spell checking libraries and apps')
source=("https://stavekontrolden.dk/dictionaries/da_DK/da_DK-$pkgver.aff"
        "https://stavekontrolden.dk/dictionaries/da_DK/da_DK-$pkgver.dic")
b2sums=('3bef0a2355c095466dd47713b921065d13098dc5aa98dd815f4620993fde08a52b3e50d6284928ecec56b66b1ef65874aa6b8e0bc68ef453807bdbf530e94476'
        '69aa516202ae76fbffd191385d7e1e986a9f92eaa494e4c593e137082d23972f384afcb6666629faa30bd82ec045accffd6ed3654f462d420ca5410e544b5916')

build() {
  # Rename downloaded files
  for file in "${source[@]}"; do
    mv $(basename $file) $(basename ${file/+([\.-]+([0-9]))/})
  done
}

package() {
  install -dm755 "${pkgdir}"/usr/share/hunspell
  install -m644 da_DK.dic da_DK.aff $pkgdir/usr/share/hunspell

  # myspell/dicts symlinks
  install -dm755 "${pkgdir}"/usr/share/myspell/dicts
  pushd "$pkgdir"/usr/share/myspell/dicts > /dev/null
    for file in "${pkgdir}"/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/"$(basename $file)" .
    done
  popd > /dev/null
}
