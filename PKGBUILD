# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=fsport-mediavps
pkgver=3.5
pkgrel=1
pkgdesc="Hi-res FreeSpace 1 resources for FSPort"
arch=('any')
url="http://fsport.hard-light.net/website/"
license=('custom:noncommercial')
depends=('fsport' 'fs2_open-mediavps')
source=(fsport-mediavps.sh fsport-mediavps.desktop LICENSE
        'http://fsport.freespacemods.net/releases/fsport-mediavps.7z'
        'http://fsport.freespacemods.net/releases/fsport-mediavps_2014.7z'
        'http://fsport.freespacemods.net/releases/fsport-mediavps_music.7z')
sha256sums=('ed989975e62cb2e0b116bf9a316305dbec3f1440080e19794eaf95bbf3f686e7'
            '09cb00100f048715b5bab6c9a1bca2a1e2ecae59d9da7a8710c018f37001f38c'
            '79462ffe82b8cf371f37a3444a8e17165d293e797a865b9c4312f86d00ddf4ec'
            'f0cc49f13730373c65c4e091a5d84bd284db069650ede460c5c4ee301118d9c9'
            '62aca6bf149d9121b3f91fa983d697829d5e099cb979d03f91f9e01b068b25ff'
            'b80ee613c7b0cc3df8990bf1e0eac78a4fd20e615ba29fbcc2b85bfd1f20b443')
noextract=(fsport-mediavps.7z
           fsport-mediavps_2014.7z
           fsport-mediavps_music.7z)

# Prevent compression
PKGEXT=".pkg.tar"

prepare() {
  cd "$srcdir"
  mkdir "$pkgname" && cd "$pkgname" || return 1
  for sv in ../*.7z; do
    bsdtar -xf $sv
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
