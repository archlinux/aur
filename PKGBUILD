# Maintainer: Jack Random <jack (at) random.to>

# Contributors from demo package:
# Samæ <eeva.samæ@marvid.fr>
# Kristaps Karlsons <kristaps.karlsons@gmail.com>
# Max Pray a.k.a. Synthead <synthead@gmail.com>
# berkus <berkus@madfire.net>
# hm_b <holger@music-nerds.net>

# You have to
#  login to https://backstage.renoise.com
#  download your copy
#  place it into same DIR as this file

pkgname="renoise"
pkgver="3.2.0"
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

source=("file://rns_${pkgver//./}_linux_x86$if64.tar.gz")

package() {
    cd "$srcdir/rns_${pkgver//./}_linux_x86$if64"

    mkdir -p "$pkgdir/usr/share/renoise-$pkgver"
    cp -r "Resources"/* "$pkgdir/usr/share/renoise-$pkgver"

    install -Dm 755 "renoise" "$pkgdir/usr/bin/renoise"
    install -Dm 644 "Installer/renoise.desktop" "$pkgdir/usr/share/applications/renoise.desktop"
    install -Dm 644 "Installer/renoise.1.gz" "$pkgdir/usr/share/man/man1/renoise.1.gz"
    install -Dm 644 "Installer/renoise-pattern-effects.5.gz" "$pkgdir/usr/share/man/man5/renoise-pattern-effects.5.gz"
    install -Dm 644 "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 644 "Installer/renoise.xml" "$pkgdir/usr/share/mime/packages/renoise.xml"
}
