# Maintainer: Jack Random <jack (at) random.to>

# Contributors from demo package:
# Samæ <eeva.samæ@marvid.fr>
# Kristaps Karlsons <kristaps.karlsons@gmail.com>
# Max Pray a.k.a. Synthead <synthead@gmail.com>
# berkus <berkus@madfire.net>
# hm_b <holger@music-nerds.net>

# You have to login to https://backstage.renoise.com and download your copy

pkgname="renoise"
pkgver="3.1.1"
pkgrel="2"
pkgdesc="A music composition program"
arch=("i686" "x86_64")
url="https://www.renoise.com"
license=("custom:renoise")
depends=("alsa-lib" "libx11" "gcc-libs")
optdepends=("jack: For JACK audio support")
makedepends=("xdg-utils")
options=("!strip")
conflicts=("renoise3-demo")

# This blurb checks if the host machine is x86 or x86_64,
# then declares the $source arrays accordingly.

if [[ $CARCH = "x86_64" ]]; then
    if64="_64"
# as the registered version is personalized, checksums are not useful
    md5sums=('SKIP')
else
    md5sums=('SKIP')
fi

source=("file://rns_${pkgver//./_}_linux_x86$if64.tar.gz")

package() {
    cd "$srcdir/rns_${pkgver//./_}_linux_x86$if64"

    mkdir -p "$pkgdir/usr/share/renoise-$pkgver"
    cp -r "Resources"/* "$pkgdir/usr/share/renoise-$pkgver"

    install -Dm 755 "renoise" "$pkgdir/usr/bin/renoise3"
    install -Dm 644 "Resources/Skin/Icons/WindowIcon16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/renoise3.png"
    install -Dm 644 "Resources/Skin/Icons/WindowIcon32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/renoise3.png"
    install -Dm 644 "Resources/Skin/Icons/WindowIcon48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/renoise3.png"
    install -Dm 644 "Resources/Skin/Icons/WindowIcon128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/renoise3.png"
    install -Dm 644 "Resources/Skin/Icons/WindowIcon256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/renoise3.png"

    install -Dm 644 "Installer/renoise.desktop" "$pkgdir/usr/share/applications/renoise3.desktop"
    sed -i 's/=renoise/=renoise3/g' "$pkgdir/usr/share/applications/renoise3.desktop"
    install -Dm 644 "Installer/renoise.1.gz" "$pkgdir/usr/share/man/man1/renoise3.1.gz"
    install -Dm 644 "Installer/renoise-pattern-effects.5.gz" "$pkgdir/usr/share/man/man5/renoise3-pattern-effects.5.gz" 
    install -Dm 644 "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
