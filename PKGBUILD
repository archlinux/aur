# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-kde-test-bin
pkgver=56.2.0
pkgrel=1
pkgdesc="Free, open and private browser with openSUSE's patches for better integration with KDE (Test Build)"
arch=('x86_64')
url="https://www.waterfoxproject.org/"
license=('MPL')
depends=('libxt' 'mime-types' 'dbus-glib' 'hunspell' 'gtk2' 'gtk3' 'nss' 'kwaterfoxhelper')
makedepends=('wget')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'speech-dispatcher: Text-to-Speech'
            'pulseaudio: Audio support'
            'alsa-lib: Audio support')
provides=("waterfox-test=$pkgver")
options=('!emptydirs' '!strip')
source=("waterfox-kde-test_${pkgver}~t${pkgrel}__amd64.deb::https://dl.bintray.com/hawkeye116477/waterfox-deb/pool/w/waterfox-test/waterfox-kde-test_${pkgver}~t${pkgrel}_amd64.deb"
        "waterfox-locales-test_${pkgver}~t${pkgrel}__amd64.deb::https://dl.bintray.com/hawkeye116477/waterfox-deb/pool/w/waterfox-test/waterfox-locales-test_${pkgver}~t${pkgrel}_amd64.deb")
sha256sums=('729f1d8039365c3192c09785f7b63770a3036d3a23cb46c40fd2900b7af2c3a3'
            'a1fdf78bd0fd950337d191fedb348b29badbb2917aed7250bf80e9ae3f783e5e')

package() {
# Extract Waterfox from .deb package
msg2 "Extracting waterfox-kde-test..."
bsdtar -xf $srcdir/waterfox-kde-test_${pkgver}~t${pkgrel}__amd64.deb
bsdtar -xf data.tar.xz -C "$pkgdir/"
msg2 "Extracting locales..."
bsdtar -xf $srcdir/waterfox-locales-test_${pkgver}~t${pkgrel}__amd64.deb
bsdtar -xf $srcdir/data.tar.xz -C "$pkgdir/"

# Use system-provided dictionaries. Hunspell symlink is in deb.
msg2 "Creating symlink to hyphen..."
ln -Ts /usr/share/hyphen "$pkgdir/opt/waterfox-test/hyphenation"

}
