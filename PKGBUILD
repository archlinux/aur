# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Contributor: Xewl - Ken Verhaegen <xewl@live.com>
# Credits to Team Shingima, AnjoCaido0, Sparamoule and KeiNett for the launcher file.

pkgname=minecraftsp-anjocaido
epoch=1
pkgver=4.400
_jarver="v${pkgver//./}"
pkgrel=3
pkgdesc='Minecraft is a sandbox game which allows players to build constructions out of textured cubes in a 3D world.'
arch=(any)
license=(unknown)
url="https://archive.org/details/shiginima-launcher"
# Based on official Minecraft dependencies
# Adjustments: gconf -> dconf
depends=('java-runtime=8' xorg-xrandr libxss libx11 libxcb alsa-lib gtk2 gtk3 dconf libxtst nss)
provides=(minecraft)
replaces=(minecraft)
source=('minecraft'
        'minecraft.desktop'
        'minecraft.png'
        'readme.txt'
        #"https://teamshiginima.com/update/ShiginimaSE_${_jarver}.zip"
        "ShiginimaSP.$_jarver.jar::https://archive.org/download/shiginima-launcher/Shiginima%20Launcher%20SE.v4400.jar")
sha256sums=('ee83fe03a964489fe201d786dfb10f6a31afdb96b1b7fd983e4c45e9ab8675bf'
            'b6a74142c394fe874206d3f5b9cbdc809972f4c39351e2a112cc92e72d3d6181'
            '81dfe3dea0a61bb314dd95271903ded6fff35cec0751794cbd33b3fc838f060e'
            'bd086bc827b404cf91a28282fc692cdf8bc97f7488b12d08828913a94d304f22'
            '03a94acfb2387dea60af8678e3bd802f78da01cddc18d9643173d3a19337de8b')
install=minecraft.install
# Extracted from the zip file
changelog=Shingima_Changelog
# Avoid extracting the files from the JAR
noextract=("ShiginimaSP.$_jarver.jar")

package() {
    cd "$srcdir"

    mkdir -p $pkgdir/usr/bin
    cp minecraft $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/minecraft

    #cp "$srcdir/linux_osx/Shiginima Launcher SE.$_jarver.jar" \
    #    $pkgdir/usr/share/minecraft/MinecraftSP.jar
    cp "$srcdir/ShiginimaSP.$_jarver.jar" "$pkgdir/usr/share/minecraft/MinecraftSP.jar"

    # Desktop launcher with icon
    install -Dm644 $srcdir/minecraft.desktop $pkgdir/usr/share/applications/minecraft.desktop
    install -Dm644 $srcdir/minecraft.png     $pkgdir/usr/share/pixmaps/minecraft.png

    # Readme
    install -Dm644 $srcdir/readme.txt        $pkgdir/usr/share/minecraft/readme.txt
}
