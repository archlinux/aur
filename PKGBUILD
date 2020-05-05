# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Contributor: Xewl - Ken Verhaegen <xewl@live.com>
# Credits to Team Shingima, AnjoCaido0, Sparamoule and KeiNett for the launcher file.

pkgname=minecraftsp-anjocaido
epoch=1
pkgver=4.400
_jarver="v${pkgver//./}"
pkgrel=1
pkgdesc="Minecraft is a sandbox game which allows players to build constructions out of textured cubes in a 3D world."
arch=(any)
license=(unknown)
url="https://teamshiginima.com/update/"
# Based on official Minecraft dependencies
# Adjustments: gconf -> dconf
depends=('java-runtime=8' xorg-xrandr libxss libx11 libxcb alsa-lib gtk2 gtk3 dconf libxtst nss)
provides=(minecraft)
replaces=(minecraft)
source=('minecraft'
        'minecraft.desktop'
        'minecraft.png'
        'readme.txt'
        "https://teamshiginima.com/update/ShiginimaSE_${_jarver}.zip")
sha256sums=('ee83fe03a964489fe201d786dfb10f6a31afdb96b1b7fd983e4c45e9ab8675bf'
            'b6a74142c394fe874206d3f5b9cbdc809972f4c39351e2a112cc92e72d3d6181'
            '81dfe3dea0a61bb314dd95271903ded6fff35cec0751794cbd33b3fc838f060e'
            'bd086bc827b404cf91a28282fc692cdf8bc97f7488b12d08828913a94d304f22'
            'a62e5272a29a926bc236ec2fa4f06d28600006751247039eb18f50fe95038a22')
install=minecraft.install
# Extracted from the zip file
changelog=Shingima_Changelog

package() {
    cd "$srcdir"

    mkdir -p $pkgdir/usr/bin
    cp minecraft $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/minecraft
    cp "$srcdir/linux_osx/Shiginima Launcher SE.$_jarver.jar" \
        $pkgdir/usr/share/minecraft/MinecraftSP.jar

    # Desktop launcher with icon
    install -Dm644 $srcdir/minecraft.desktop $pkgdir/usr/share/applications/minecraft.desktop
    install -Dm644 $srcdir/minecraft.png     $pkgdir/usr/share/pixmaps/minecraft.png

    # Readme
    install -Dm644 $srcdir/readme.txt        $pkgdir/usr/share/minecraft/readme.txt
}
