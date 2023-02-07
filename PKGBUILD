# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=bandcamp-collection-downloader
_pkgver=2021-12-05
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="CLI downloader of your purchase from Bandcamp"
arch=(any)
url="https://framagit.org/Ezwen/bandcamp-collection-downloader"
license=(AGPL3)
depends=(java-runtime-headless)
makedepends=(git gradle)
source=("git+https://framagit.org/Ezwen/bandcamp-collection-downloader.git#tag=v${_pkgver}"
        'bandcamp-collection-downloader.sh')
sha256sums=('SKIP'
            'af5f89fefed91d7669d1b2dd35de2a294bbcbced8fea40c5abb45011caf57209')

build() {
  cd bandcamp-collection-downloader
  gradle -Dorg.gradle.daemon=false fatjar
}

package() {
  cd bandcamp-collection-downloader
  install -D build/libs/bandcamp-collection-downloader.jar -t "${pkgdir}/usr/share/java/bandcamp-collection-downloader/"
  install -D ../bandcamp-collection-downloader.sh "${pkgdir}/usr/bin/bandcamp-collection-downloader"
}
