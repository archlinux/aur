# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=legion+
pkgver=1.9.1
pkgrel=1
pkgdesc='Asset Extraction tool for Apex Legends and Titanfall 2 (Wine)'
url='https://github.com/r-ex/LegionPlus'
license=('GPL3')
arch=('x86_64')
depends=('wine')
makedepends=('imagemagick')
source=("$url/releases/download/$pkgver/Legion+$pkgver.zip"
        "$pkgver-LegionIcon.ico::https://github.com/r-ex/LegionPlus/raw/$pkgver/Resources/LegionIcon.ico"
        "legion+.xml"
        "legion+.desktop"
        "legion+")
sha256sums=('748b4fc8e36c1b502f3194e425b53a7329e18a418dabc9ca58d7238dd4efd0c4'
            'f48fe476c5094e006440d1707c81da7e03099c7d37eba9d9eccf0f2b216ec8d5'
            '86e01fd95376f33b22ed16fd53b9d3cebe4f902711a9709eb583d71fc94d12e5'
            '5c57644fc35bd713fa32586b512d3741536d1fa2c6641c4b0d399d02ab58cab0'
            '5f3632aaabda872fe67975c0837b9d87f620fa41eb846490efa57186e3860b05')

prepare() {
        echo "! This package installs symlinks to the home directory in '~/.local/share/wineprefixes/legion+'"
        echo "! because Legion+ creates files in the same folder it's opened and must have write access to them"
    sleep 2

  convert $pkgver-LegionIcon.ico -strip legion+.png
}

package() {
  # Create a directory
  mkdir -p "$pkgdir/usr/share/legion+"
  # Install
  install -Dm644 legion+.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/legion+.png"
  install -Dm644 legion+.xml -t "$pkgdir/usr/share/mime/packages"
  install -Dm644 legion+.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 legion+ -t "$pkgdir/usr/bin"
  mv mileswin64.dll LegionPlus.exe binkawin64.dll "$pkgdir/usr/share/legion+"


        echo "! This package installs symlinks to the home directory in '~/.local/share/wineprefixes/legion+'"
        echo "! because Legion+ creates files in the same folder it's opened and must have write access to them"
    sleep 4 && echo "Continuing the installation.." && sleep 2
        #! Create a directory in the home directory (if it doesn't exist)
    mkdir -p $HOME/.local/share/wineprefixes/legion+

        #! Symlinks for the home directory
    ln -fs /usr/share/legion+/binkawin64.dll $HOME/.local/share/wineprefixes/legion+
    ln -fs /usr/share/legion+/mileswin64.dll $HOME/.local/share/wineprefixes/legion+
    ln -fs /usr/share/legion+/LegionPlus.exe $HOME/.local/share/wineprefixes/legion+
}
