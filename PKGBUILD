# Maintainer: Daniel Sonck <daniel (at) sonck (dot) nl>
# Contributor: Jack Random <jack (at) random.to>

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
pkgver="3.4.3"
pkgrel="1"
pkgdesc="A music composition program"
arch=("x86_64" "aarch64" "armv7h")
url="https://www.renoise.com"
license=("custom:renoise")
depends=("alsa-lib" "libx11" "gcc-libs")
optdepends=("jack: For JACK audio support")
options=("!strip")
conflicts=("renoise3-demo")

source_x86_64=("file://rns_${pkgver//./}_linux_x86_64.tar.gz")
source_aarch64=("file://rns_${pkgver//./}_linux_arm64.tar.gz")
source_armv7h=("file://rns_${pkgver//./}_linux_armhf.tar.gz")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')

_arch='x86_64'
case "$CARCH" in
    'aarch64') _arch='arm64' ;;
    'armv7h')  _arch='armhf' ;;
esac


package() {
    cd "$srcdir/rns_${pkgver//./}_linux_${_arch}"

    mkdir -p "$pkgdir/usr/share/renoise-$pkgver"
    cp -r "Resources"/* "$pkgdir/usr/share/renoise-$pkgver"

    install -Dm 755 "renoise" "$pkgdir/usr/bin/renoise"
    install -Dm 644 "Installer/renoise.desktop" "$pkgdir/usr/share/applications/renoise.desktop"
    install -Dm 644 "Installer/renoise.1.gz" "$pkgdir/usr/share/man/man1/renoise.1.gz"
    install -Dm 644 "Installer/renoise-pattern-effects.5.gz" "$pkgdir/usr/share/man/man5/renoise-pattern-effects.5.gz"
    install -Dm 644 "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 644 "Installer/renoise.xml" "$pkgdir/usr/share/mime/packages/renoise.xml"
    install -Dm 644 "Installer/renoise-48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/renoise.png"
    install -Dm 644 "Installer/renoise-64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/renoise.png"
    install -Dm 644 "Installer/renoise-128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/renoise.png"
}
