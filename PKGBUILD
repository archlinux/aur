# Maintainer: Samæ <eeva.samæ@marvid.fr>
# Previous maintainer: Kristaps Karlsons <kristaps.karlsons@gmail.com>

# Original contributors (renoise-demo):
# Max Pray a.k.a. Synthead <synthead@gmail.com>
# berkus <berkus@madfire.net>
# hm_b <holger@music-nerds.net>

pkgname="renoise3-demo"
pkgver="3.0.1"
pkgrel="1"
pkgdesc="A music composition program"
arch=("i686" "x86_64")
url="http://www.renoise.com"
license=("custom:renoise")
depends=("alsa-lib" "libx11" "gcc-libs")
optdepends=("jack: For JACK audio support"
            "jack2: For JACK2 audio support")
makedepends=("xdg-utils")
options=("!strip")

# This blurb checks if the host machine is x86 or x86_64,
# then declares the $md5sums and $source arrays accordingly.
if [[ $CARCH = "x86_64" ]]; then
    if64="_64"
    md5sums=('9fe1467691af0a869a5c5d4d0be51023')
else
    md5sums=('e58958e8634c13a8291ce33e9b11c643')
fi
source=("http://files.renoise.com/demo/Renoise_${pkgver//./_}_Demo_x86$if64.tar.bz2")

package() {
    cd "$srcdir/Renoise_${pkgver//./_}_Demo_x86$if64"

    mkdir -p "$pkgdir/usr/share/renoise-$pkgver"
    cp -r "Resources"/* "$pkgdir/usr/share/renoise-$pkgver"

    install -Dm 755 "renoise" "$pkgdir/usr/bin/renoise3"
    install -Dm 644 "Installer/renoise.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/renoise3.png"
    install -Dm 644 "Installer/renoise.desktop" "$pkgdir/usr/share/applications/renoise3.desktop"
    sed -i 's/=renoise/=renoise3/g' "$pkgdir/usr/share/applications/renoise3.desktop"
    install -Dm 644 "Installer/renoise.1.gz" "$pkgdir/usr/share/man/man1/renoise3.1.gz"
    install -Dm 644 "Installer/renoise-pattern-effects.5.gz" "$pkgdir/usr/share/man/man5/renoise3-pattern-effects.5.gz" 
    install -Dm 644 "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
