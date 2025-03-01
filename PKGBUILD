pkgname=srb2-bin
pkgver=2.2.15
pkgrel=2
pkgdesc="A 3D Sonic fan game based off of Doom Legacy aka Sonic Robo Blast 2."
arch=('i686' 'x86_64' 'aarch64')
url='https://gitlab.com/linuxbombay/srb2-bin/sonic-robo-blast-2'
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'libpng' 'libgme' "srb2-data" 'libopenmpt' 'miniupnpc')
sha256sums=('e511f451bea17d061fcf8a887f2a50d9ac2c7514b4b70d33d8b1d193dbf8ff1b'
            '24675ce8385b11e05be76e37e34604e7fb8b6371f0f973a2583c081dfeb821a7')
sha256sums_i686=('de210c1e8f30a0a1acedffb74edbe257d5971b181353b57e7b02e1e7d456078d')
sha256sums_x86_64=('fa15a83daa51e9fdaf912d1bc7f3cec8f40321af53c274dd4bc0066e8de508ad')
sha256sums_aarch64=('9b754b6a2b8bb848e1e4ce2e1ebf2ab2e3799cb04e3f9ead0d8b48c4b2beda0d')
source=("srb2.desktop" "srb2.png")
source_i686=("https://gitlab.com/linuxbombay/srb2-bin/binaries/$pkgver/-/raw/main/srb2-linux-i686.tar.xz")
source_x86_64=("https://gitlab.com/linuxbombay/srb2-bin/binaries/$pkgver/-/raw/main/srb2-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/linuxbombay/srb2-bin/binaries/$pkgver/-/raw/main/srb2-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/applications"
    
    #Lib fix for X64, Arm64 and i686
    if [ ! -e /usr/lib/libminiupnpc.so.18 ]; then
      ln -s /usr/lib/libminiupnpc.so $pkgdir/usr/lib/libminiupnpc.so.18
    fi
    if [ ! -e /usr/lib/libminiupnpc.so.17 ]; then
      ln -s /usr/lib/libminiupnpc.so $pkgdir/usr/lib/libminiupnpc.so.17
    fi    
    install -Dm655 "$srcdir/srb2.png" "$pkgdir/usr/share/pixmaps"
    install -Dm755 "$srcdir/srb2.desktop" "$pkgdir/usr/share/applications"
    install -m775 "$srcdir/srb2" "$pkgdir/usr/bin"
}
