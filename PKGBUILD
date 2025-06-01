# Maintainer: lod <aur@cyber-anlage.de>
# Contributer: Donn <me@donn.website>

pkgname=cemu-bin
pkgver=2.6
pkgrel=2
pkgdesc="Nintendo Wii U Emulator"
arch=('x86_64')
url="https://cemu.info"
license=('MPL-2.0')
depends=('at-spi2-core' 'bluez-libs' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'glu' 'gtk3' 'harfbuzz' 'hicolor-icon-theme'
         'libglvnd' 'libice' 'libpng' 'libsm' 'libx11' 'libxext' 'libxkbcommon' 'libxrender' 'pango' 'systemd-libs' 'wayland')
provides=('cemu')
conflicts=('cemu')
options=('!debug')
source=("https://github.com/cemu-project/Cemu/releases/download/v$pkgver/cemu-$pkgver-ubuntu-22.04-x64.zip"
        "https://raw.githubusercontent.com/cemu-project/Cemu/refs/tags/v$pkgver/dist/linux/info.cemu.Cemu.desktop"
        "https://raw.githubusercontent.com/cemu-project/Cemu/refs/tags/v$pkgver/dist/linux/info.cemu.Cemu.png"
        "https://raw.githubusercontent.com/cemu-project/Cemu/refs/tags/v$pkgver/dist/linux/info.cemu.Cemu.metainfo.xml")
b2sums=('a91e08b1ddfc726c1bb003b06aab1b29b2787f582bdabd0a791992666648d9d0519735ba57903f69bd60a6a967a4a5b3eb08027c645bfab3964c6a37bce75b0c'
        '66d0790e8d0b1220b73e4120c65a4e91fb7303f9171e7dfa14c38683b52089b59455e016616b4a23e52f0f74999f65a51cfd157de70a62557c808c7ef6454efe'
        'a4f65a6c849adb4a75b911ba2ad47a20f06e277274b5764fe192066336d169b13fde75dba8ca67ad59d6f0dafba5805c7fcb969e859e5bf819405efce1fa02c6'
        'fde11181d1ad4b6d28417d6842cef3a436e856acf312b4066c071a0f933bba676d99a041c5b1bf695a09833d92bc2cf47f0ce5ae179e80f6ba587bc79991a2d3')
            
package() {
  cd $srcdir/Cemu_$pkgver
  
  install -Dm 755 ./Cemu $pkgdir/usr/bin/cemu

  install -d $pkgdir/usr/share/Cemu
  cp -r ./{gameProfiles,resources} $pkgdir/usr/share/Cemu

  sed -i -e '/^Exec=Cemu/cExec=cemu' $srcdir/info.cemu.Cemu.desktop
  install -Dm 644 -t $pkgdir/usr/share/applications $srcdir/info.cemu.Cemu.desktop
  install -Dm 644 -t $pkgdir/usr/share/icons/hicolor/128x128/apps $srcdir/info.cemu.Cemu.png
  install -Dm 644 -t $pkgdir/usr/share/metainfo $srcdir/info.cemu.Cemu.metainfo.xml
}
