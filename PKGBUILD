# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=fsport-mediavps
pkgver=3.4
pkgrel=2
pkgdesc="Hi-res FreeSpace 1 resources for FSPort"
arch=('any')
url="http://fsport.hard-light.net/website/"
license=('custom:noncommercial')
depends=('fsport')
makedepends=('unzip')
source=(fsport-mediavps.sh fsport-mediavps.desktop LICENSE
        'http://fsport.freespacemods.net/releases/fsport-mediavps.zip'
        'http://fsport.freespacemods.net/releases/fsport-mediavps_music.zip')
sha256sums=('d733c40af34b2b5fda74788fe4f949a08a511c52c1211bd86e6926d78b375110'
            '09cb00100f048715b5bab6c9a1bca2a1e2ecae59d9da7a8710c018f37001f38c'
            '79462ffe82b8cf371f37a3444a8e17165d293e797a865b9c4312f86d00ddf4ec'
            '2e925039df10b796377fa3259b7d05d02f7bc2fe19b642e963000004660b882a'
            '977714e2560b320901002284a68f89505defe9c1d1fa07e2096ffc00d8713518')
noextract=(fsport-mediavps.zip
           fsport-mediavps_music.zip)

# Prevent compression
PKGEXT=".pkg.tar"

prepare() {
  cd "$srcdir"
  mkdir "$pkgname" && cd "$pkgname" || return 1
  for zip in ../*.zip; do
    unzip $zip
  done
}

package() {
  cd "$srcdir"

  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -D -m 644 fsport-mediavps.desktop "$pkgdir"/usr/share/applications/fsport-mediavps.desktop
  install -D -m 755 fsport-mediavps.sh "$pkgdir"/usr/bin/fsport-mediavps

  mkdir -p "$pkgdir"/opt/fs2_open || return 1

  # Not really proper to use mv, but saves space and time
  mv "$pkgname" "$pkgdir"/opt/fs2_open
}
