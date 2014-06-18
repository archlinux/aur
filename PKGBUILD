# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=fsport
pkgver=3.4
pkgrel=3
pkgdesc="The original FreeSpace campaigns ported to FreeSpace 2"
arch=('any')
url="http://fsport.hard-light.net/website/"
license=('custom:noncommercial')
depends=('fs2_open')
makedepends=('unzip')
optdepends=('fs2_open-mediavps: Hi-res FS2 resources'
            'fsport-mediavps: Hi-res FS1 resources'
            'fsport-tangovps: Hi-res Command Brief animations')
source=(fsport.sh fsport.desktop LICENSE
        'http://fsport.freespacemods.net/releases/fsport3_4.zip'
        'http://fsport.freespacemods.net/releases/fsport-missions.zip'
        'http://fsport.freespacemods.net/releases/odeon_fs1.zip'
        'http://fsport.freespacemods.net/releases/sparky_hi_fs1.zip'
        'http://fsport.freespacemods.net/releases/stu_fs1.zip'
        'http://fsport.freespacemods.net/releases/tango_fs1.zip'
        'http://fsport.freespacemods.net/releases/warble_fs1.zip')
sha256sums=('e443c079fe7c2bc6ed85028aa16cfe83d4b159511e83f0ae2448bb8f845e8b2f'
            'c7c64510205f78eabc4ff52fa134da7a0877e1a768253cd2e8de9c67af994f3e'
            '79462ffe82b8cf371f37a3444a8e17165d293e797a865b9c4312f86d00ddf4ec'
            '1c51a14756ccb8c6448f321c4d007bdb46242c752d0e66167a2278d0c82324f8'
            '27149c9965765c5e8e3afe99b35429ca7e0764740305c71ae93485a903660917'
            'e3ea303b0686abe3ec5f4f5f0f3da119e5fabc2e98ec41888dd3ee0a653e6ddf'
            '3c4cd57d302612780fba66ec57bf7a94d2d2c86d316afc3a80e35d5b5bd78015'
            '842dd9891b7908e276884d8d6ae74c877a8a9a33aef06f582ce8c7c04b8d3215'
            'f16f427b9330804aebac89746d4a2be3ab149e05b7bca3695a514c33cdbde2a0'
            '5e14c96ccfbb2e382a8b464694e5ad370b50c99489ecc8021617f5f6722c77c9')
noextract=(fsport3_4.zip
           fsport-missions.zip
           odeon_fs1.zip
           sparky_hi_fs1.zip
           stu_fs1.zip
           tango_fs1.zip
           warble_fs1.zip)

# Prevent compression
PKGEXT=".pkg.tar"

prepare() {
  cd "$srcdir"
  mkdir "$pkgname" && cd "$pkgname" || return 1
  for zip in ../*.zip; do
    unzip $zip
  done

  rm -f *.bat
}

package() {
  cd "$srcdir"

  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -D -m 755 fsport.sh "$pkgdir"/usr/bin/fsport
  install -D -m 644 fsport.desktop "$pkgdir"/usr/share/applications/fsport.desktop

  mkdir -p "$pkgdir"/opt/fs2_open || return 1

  # Not really proper to use mv, but saves space and time
  mv "$pkgname" "$pkgdir"/opt/fs2_open
}
