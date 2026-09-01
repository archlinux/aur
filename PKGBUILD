# Maintainer: MaddieMewmews <maddie at mewmews dot gay>
# Contributor: TheTrueColonel <benjaminesims@gmail.com>
# Contributor: NicKoehler <grillinicolavocal at gmail dot com>
_pkgname=SuperZSNES
_execname=SUPERZSNES
pkgname=superzsnes
pkgver=0.300
pkgrel=1
pkgdesc="A GPU-powered SNES Emulator developed in Unity"
arch=("x86_64")
url="https://www.zsnes.com/"
install=$pkgname.install
license=('freeware-proprietary')
depends=("hidapi" "systemd-libs" "alsa-lib" "gtk3" "glib2" "libdecor")
source=(
    "$_execname.sh"
    "$_execname.desktop"
    "https://www.zsnes.com/files/${_pkgname}_v${pkgver}.tar.gz"
)
sha256sums=('091fc53feea1ae09eb9cf22d1bc98b700dd5441b640586e3c0d75d663d377e43'
            '420f11c4a717d11a955b5bc64238fbd5398c5aae3676d2b531de5da7a409ee27'
            '3f7d006d8bea9531878d6f3db0db8390cd7dd4bcde20c3439438ef8973e22c95')

package() {

    # create dirs
    install -dm755 "$pkgdir/usr/bin"
    install -dm777 "$pkgdir/opt/$_pkgname"

    # install binaries
    install -Dm777 "${_execname}.sh" "$pkgdir/usr/bin/$_execname"
    install -Dm777 "$srcdir/UnityPlayer.so" "$pkgdir/opt/$_pkgname/"
    install -Dm777 "$srcdir/${_execname}" "$pkgdir/opt/$_pkgname/${_execname}"
    cp -r "$srcdir/${_execname}_Data" "$pkgdir/opt/$_pkgname/${_execname}_Data"

    # install icon and .desktop
    install -Dm644 "$pkgdir/opt/$_pkgname/${_execname}_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    install -Dm644 "$srcdir/$_execname.desktop" "$pkgdir/usr/share/applications/$_execname.desktop"

}
