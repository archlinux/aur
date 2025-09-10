# Maintainer: level666 <lev3l666@gmail.com>

pkgname=zeppossimulator
pkgver=2.0.2
pkgrel=1
pkgdesc="Zepp OS simulator"
arch=('x86_64')
url="https://zeppos.com/developer/simulator/"
license=('custom')
depends=('gtk3' 'cyrus-sasl')
source=("https://upload-cdn.zepp.com/zepp-applet-and-wechat-applet/20240927/3e688d423cd0cd31a8a589b8325a309e.deb")
sha256sums=('647a9a10bf05a129d1b6ea865a94f22646bb0f4747b5100366d86af031b6936e')

package() {
    # Extract the data.tar.xz file from the already-extracted .deb package
    tar -xf "$srcdir/data.tar.xz" -C "$srcdir/"

    # Copy the simulator files to the correct directory
    install -d "$pkgdir/opt/simulator/"
    cp -r "$srcdir/opt/simulator/"* "$pkgdir/opt/simulator/"

    # Copy desktop file and icon
    install -d "$pkgdir/usr/share/applications/"
    install -m644 "$srcdir/usr/share/applications/simulator.desktop" "$pkgdir/usr/share/applications/"

    install -d "$pkgdir/usr/share/icons/hicolor/0x0/apps/"
    install -m644 "$srcdir/usr/share/icons/hicolor/0x0/apps/simulator.png" "$pkgdir/usr/share/icons/hicolor/0x0/apps/"

    # Create a symbolic link for the executable in a system PATH directory
    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/simulator/simulator" "$pkgdir/usr/bin/simulator"
}
