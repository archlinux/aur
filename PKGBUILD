# Maintainer: lod <aur@cyber-anlage.de>
# Contributer: Donn <me@donn.website>

pkgname=cemu-bin
pkgver=2.0.60
pkgrel=1
pkgdesc="Nintendo Wii U Emulator"
arch=('x86_64')
url="https://cemu.info"
license=('MPL2')
depends=('at-spi2-core' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'glu' 'gtk3' 'harfbuzz' 'hicolor-icon-theme'
         'libglvnd' 'libice' 'libpng' 'libsm' 'libx11' 'libxext' 'libxrender' 'pango' 'systemd-libs' 'wayland')
provides=('cemu')
conflicts=('cemu')
options=('!debug')
_srcver=${pkgver%.*}-${pkgver##*.}
source=("https://github.com/cemu-project/Cemu/releases/download/v$_srcver/cemu-$_srcver-ubuntu-22.04-x64.zip"
        "https://raw.githubusercontent.com/cemu-project/Cemu/main/dist/linux/info.cemu.Cemu.desktop"
        "https://github.com/cemu-project/Cemu/raw/main/dist/linux/info.cemu.Cemu.png"
        "https://raw.githubusercontent.com/cemu-project/Cemu/main/dist/linux/info.cemu.Cemu.metainfo.xml")
b2sums=('81f08e7a75a3aa3fa5ab10600df48c59e89dc7e13f6c17991eeff2ebd57941424849216f637251852bb712ec53a88bb9b4f3d0db8baa948c2de4de5f29aa2d6a'
        '66d0790e8d0b1220b73e4120c65a4e91fb7303f9171e7dfa14c38683b52089b59455e016616b4a23e52f0f74999f65a51cfd157de70a62557c808c7ef6454efe'
        'a4f65a6c849adb4a75b911ba2ad47a20f06e277274b5764fe192066336d169b13fde75dba8ca67ad59d6f0dafba5805c7fcb969e859e5bf819405efce1fa02c6'
        'fde11181d1ad4b6d28417d6842cef3a436e856acf312b4066c071a0f933bba676d99a041c5b1bf695a09833d92bc2cf47f0ce5ae179e80f6ba587bc79991a2d3')
            
package() {
  cd $srcdir/Cemu_$_srcver
  
  install -Dm 755 ./Cemu $pkgdir/usr/bin/cemu

  install -d $pkgdir/usr/share/Cemu
  cp -r ./{gameProfiles,resources,shaderCache} $pkgdir/usr/share/Cemu

  sed -i -e '/^Exec=Cemu/cExec=cemu' $srcdir/info.cemu.Cemu.desktop
  install -Dm 644 -t $pkgdir/usr/share/applications $srcdir/info.cemu.Cemu.desktop
  install -Dm 644 -t $pkgdir/usr/share/icons/hicolor/128x128/apps $srcdir/info.cemu.Cemu.png
  install -Dm 644 -t $pkgdir/usr/share/metainfo $srcdir/info.cemu.Cemu.metainfo.xml
}
