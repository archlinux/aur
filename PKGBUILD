# Maintainer: lod <aur@cyber-anlage.de>
# Contributer: Donn <me@donn.website>

pkgname=cemu-bin
pkgver=2.0.44
pkgrel=1
pkgdesc="Nintendo Wii U Emulator"
arch=('x86_64')
url="https://cemu.info"
license=('MPL2')
depends=('at-spi2-core' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'glu' 'gtk3' 'harfbuzz' 'hicolor-icon-theme'
         'libglvnd' 'libice' 'libpng' 'libsm' 'libx11' 'libxext' 'libxrender' 'pango' 'wayland')
provides=('cemu')
conflicts=('cemu' 'cemu-git')
options=(!strip !docs libtool emptydirs)
_srcver=${pkgver%.*}-${pkgver##*.}
source=("https://github.com/cemu-project/Cemu/releases/download/v$_srcver/cemu-$_srcver-ubuntu-20.04-x64.zip"
        "https://raw.githubusercontent.com/cemu-project/Cemu/main/dist/linux/info.cemu.Cemu.desktop"
        "https://github.com/cemu-project/Cemu/raw/main/dist/linux/info.cemu.Cemu.png"
        "https://raw.githubusercontent.com/cemu-project/Cemu/main/dist/linux/info.cemu.Cemu.metainfo.xml")
b2sums=('85c41e319c3c9d22b3bce17a25a7b7fab463763f69a67ec4632dd4660c9cc27e7197ab5d29dff6caf5fc3a8e293ab34fc946e5d6566263dcab359561fbef9c1b'
        '66d0790e8d0b1220b73e4120c65a4e91fb7303f9171e7dfa14c38683b52089b59455e016616b4a23e52f0f74999f65a51cfd157de70a62557c808c7ef6454efe'
        'a4f65a6c849adb4a75b911ba2ad47a20f06e277274b5764fe192066336d169b13fde75dba8ca67ad59d6f0dafba5805c7fcb969e859e5bf819405efce1fa02c6'
        '51f787f6c6c15382da4d41c9d56c22b2ad9b99a807ffaf0101b52c7dbcdc3d904f7145bea70fd3a6eb7f5cf2025e8a4c814089a21e5f2c502cd38b30dbda4f42')
            
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
