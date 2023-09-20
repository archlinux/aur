# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=legion+
pkgver=1.8.0
pkgrel=1
pkgdesc='Asset Extraction tool for Apex Legends and Titanfall 2 (Wine)'
arch=('x86_64')
url='https://github.com/r-ex/LegionPlus'
license=('GPL3')
depends=('wine')
makedepends=('imagemagick')
source=("$url/releases/download/$pkgver/Legion+$pkgver.zip"
        "$pkgver-LegionIcon.ico::https://raw.githubusercontent.com/r-ex/LegionPlus/$pkgver/Resources/LegionIcon.ico"
        "$pkgname.xml"
        "$pkgname.desktop"
        "$pkgname")
sha256sums=('c9eb00382727f39370e981be222b8f5427c12333bcad4284d333619a2e067a54'
            'SKIP'
            '86e01fd95376f33b22ed16fd53b9d3cebe4f902711a9709eb583d71fc94d12e5'
            '5c57644fc35bd713fa32586b512d3741536d1fa2c6641c4b0d399d02ab58cab0'
            '5f3632aaabda872fe67975c0837b9d87f620fa41eb846490efa57186e3860b05')

prepare() {
        echo "! This package installs symlinks to the home directory in '~/.local/share/wineprefixes/legion+'"
        echo "! because Legion+ creates files in the same folder it's opened and must have write access to them"
    sleep 2

  convert $pkgver-LegionIcon.ico -strip $pkgname.png
}

package() {
  # Create a folder
  mkdir -p "$pkgdir/usr/share/legion+"
  # Install
  install -Dm644 $pkgname.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
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
