# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=legion+
pkgver=1.7.0
pkgrel=6
pkgdesc='Asset Extraction tool for Apex Legends and Titanfall 2 (Wine)'
arch=('x86_64')
url='https://github.com/r-ex/LegionPlus'
license=('GPL3')
depends=('wine')
makedepends=('imagemagick')
source=("$url/releases/download/$pkgver/Legion+$pkgver.zip"
        "https://raw.githubusercontent.com/r-ex/LegionPlus/$pkgver/Resources/LegionIcon.ico"
        "$pkgname.xml"
        "$pkgname.desktop"
        "$pkgname")
sha256sums=('ec36829016fc2e67630c9a17f79db327d9680d8f21c43b01541f25a351f6f75f'
            'SKIP'
            'e4847ffa0d870b30421f03b56124736159cee2b8567ae61e62e3978aeb1db09a'
            '5c57644fc35bd713fa32586b512d3741536d1fa2c6641c4b0d399d02ab58cab0'
            '5f3632aaabda872fe67975c0837b9d87f620fa41eb846490efa57186e3860b05')

prepare() {
        echo "! This package installs symlinks to the home directory in '~/.local/share/wineprefixes/legion+'"
        echo "! because Legion+ creates files in the same folder it's opened and must have write access to them"
    sleep 2

  convert LegionIcon.ico -strip LegionIcon.png
}

package() {
  # Install icons
  install -Dm644 LegionIcon-0.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 LegionIcon-1.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 LegionIcon-2.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 LegionIcon-3.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 LegionIcon-4.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 LegionIcon-5.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png"

  # Create a folder
  mkdir -p "$pkgdir/usr/share/legion+"
  # Install
  install -Dm644 $pkgname.xml -t "$pkgdir/usr/share/mime/packages"
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 $pkgname -t "$pkgdir/usr/bin"
  mv mileswin64.dll LegionPlus.exe binkawin64.dll "$pkgdir/usr/share/legion+"


        echo "! This package installs symlinks to the home directory in '~/.local/share/wineprefixes/legion+'"
        echo "! because Legion+ creates files in the same folder it's opened and must have write access to them"
    sleep 4 && echo "Continuing the installation.." && sleep 2
        #! Create a folder in the home directory (if it doesn't exist)
    mkdir -p $HOME/.local/share/wineprefixes/legion+

        #! Symlinks for the home directory
    ln -fs /usr/share/legion+/binkawin64.dll $HOME/.local/share/wineprefixes/legion+
    ln -fs /usr/share/legion+/mileswin64.dll $HOME/.local/share/wineprefixes/legion+
    ln -fs /usr/share/legion+/LegionPlus.exe $HOME/.local/share/wineprefixes/legion+
}
