# Maintainer: Nobbele <realnobbele@gmail.com>

pkgname=thinlinc
pkgver=4.15.0_3258
pkgrel=1
pkgdesc="The Linux remote desktop server built on open source technology."
url="https://www.cendio.com/thinlinc"
arch=('x86_64')
license=('custom')
depends=(libx11 alsa-lib libpulse pulseaudio hicolor-icon-theme)
source=($pkgname-$pkgver.rpm::"https://www.cendio.com/downloads/clients/thinlinc-client-${pkgver/_/-}.$CARCH.rpm")
sha256sums=(SKIP)
install='fix.install'

package() {
    # Remove downloaded rpm.
    rm "$srcdir/$pkgname-$pkgver.rpm"

    # Create binary symlinks.
    mkdir -p "$pkgdir/usr/bin/"
    ln -s "/opt/thinlinc/bin/tlclient" "$pkgdir/usr/bin/tlclient"
    ln -s "/opt/thinlinc/bin/tlclient-openconf" "$pkgdir/usr/bin/tlclient-openconf"

    # Copy $srcdir to $pkgdir, keeping permissions and flags.
    cp -dpr "$srcdir/." "$pkgdir/"

    # Copy licenses
    mkdir -p "$pkgdir/usr/share/licenses/thinlinc"
    cp "$srcdir/opt/thinlinc/lib/tlclient/open_source_licenses.txt" "$pkgdir/usr/share/licenses/thinlinc"
}
