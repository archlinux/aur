pkgname=openbor-bin
pkgrlname=openbor
pkgver=3.0.0
pkgrel=1
pkgdesc="OpenBOR, a royalty free sprite-based side scrolling gaming engine."
arch=('x86_64')
url=""
license=('GPL')
depends=('unzip' 'sdl2' 'sdl2_gfx' 'libpng' 'libvorbis' 'libvpx')
makedepends=('unzip')
sha256sums=(SKIP)
source=(https://github.com/DCurrent/openbor/releases/download/v6391/OpenBOR.v3.0.Build.6391.7z)

prepare() {
    for dir in OpenBOR*/ ; do mv -v "${dir}" "$pkgrlname" ;done;
    cd "$srcdir/$pkgrlname/LINUX/OpenBOR"
    #for f in *.AppImage/ ; do mv "${f}" "$pkgrlname.Appimage" ;done
    mv *.AppImage $pkgrlname.AppImage
    "./$pkgrlname.AppImage" --appimage-extract
    #Stripping out libs and other files
    cd $srcdir/$pkgrlname/LINUX/OpenBOR/squashfs-root/usr/lib
    rm -rf libwayland-cursor.so.0 libXau.so.6 libSDL2-2.0.so.0 libSDL2_gfx-1.0.so.0 libSDL2_gfx-1.0.so.0 libXcursor.so.1 libXdmcp.so.6 libXext.so.6 libXfixes.so.3 libXi.so.6 libXinerama.so.1 libXrandr.so.2 libXrender.so.1 libXss.so.1 libXxf86vm.so.1 libapparmor.so.1 libasyncns.so.0 libbsd.so.0 libdbus-1.so.3 libgcrypt.so.20 liblzma.so.5 libnsl.so.1 libogg.so.0 libpulse.so.0 libsndfile.so.1 libsystemd.so.0 libvorbis.so.0 libvorbisenc.so.2 libvorbisfile.so.3 libvpx.so.3 libvpx.so.3 libwayland-client.so.0 libwayland-egl.so.1 libxkbcommon.so.0
    cd $srcdir/$pkgrlname/LINUX/OpenBOR/squashfs-root
    rm -rf .DirIcon 
}
package() {
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/bin"

    #Moving
    cd $srcdir/$pkgrlname/LINUX/OpenBOR/squashfs-root
    cp -r ./ "$pkgdir"
    mv "$pkgdir/usr/bin/OpenBOR" "$pkgdir/usr/bin/openbor"
}
