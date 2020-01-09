# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=72.0
pkgrel=1
pkgdesc="Community-maintained fork of Librefox: a privacy and security-focused browser"
arch=(x86_64 aarch64)
license=(MPL GPL LGPL)
url="https://LibreWolf.gitlab.io"
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!emptydirs)
install=librewolf-bin.install

case "$CARCH" in
        aarch64) _uploadh='65aad4ccb9f57a36832db4a0044fb955'
                sha256sums+=('130f23b776c11df005ab49e6dbfa5c71e0e066331344e5712659c5cc551316bf')
                ;;
        x86_64) _uploadh='a6d08bd28a6649746189da8d39bcae9d'
                sha256sums+=('baac42bbb850a4006417ae67ce9587d1539199ce57de8e81fda9034d0de5f67e')
                ;;
esac

_uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/uploads/${_uploadh}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
# _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/-/jobs/${_uploadh}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
source=(${_uploadpath})

package() {
  # Yep, that's somewhat stupid.
  # Will hopefully be improved once the main librewolf-ci works properly.
  cp -r $srcdir/usr $pkgdir/
}
