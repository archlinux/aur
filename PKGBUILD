pkgname='ripcord'
pkgver='0.2.90'
pkgrel=2
pkgdesc='An alternative Discord client'
arch=('x86_64')
url='https://cancel.fm/ripcord/'
license=('custom')

_file="Ripcord-$pkgver-x86_64.AppImage"

source=(
  "https://cancel.fm/dl/$_file"
  'ripcord.desktop'
)

sha256sums=(
  'edb4f60d52a8c9cee1e5951bf0317fad155dfa1bff01052ad75fc9e3882061b4'
  '1774644c7f61859cbca2d2e25e71e0afcf03321f95d82dd7249f65e37c3926a6'
)

prepare() {
  chmod +x "$_file"
  "./$_file" --appimage-extract
}

package() {
  cd squashfs-root

  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/lib/ripcord/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/icons/

  install -m644 -T Ripcord_Icon.png "$pkgdir"/usr/share/icons/ripcord.png
  install -m644    "$srcdir"/ripcord.desktop "$pkgdir"/usr/share/applications

  ln -s /usr/lib/ripcord/Ripcord "$pkgdir"/usr/bin/ripcord

  rm    additional_license_information.txt
  rm    AppRun
  rm -r doc
  rm    Ripcord.desktop
  rm    Ripcord_Icon.png
  rm    Ripcord-x86_64.AppImage

  chmod 755 lib plugins plugins/*

  mv * "$pkgdir"/usr/lib/ripcord
}
