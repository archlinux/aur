# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=72.0.2
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
        aarch64) _uploadh='4148cee23389f34b1a389c8f146fd80b'
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/uploads/${_uploadh}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
                sha256sums+=('d8ee4c8e31ecbabfe3fdcc8df9cd6ef41dd5667213025d8bd5793ec82e76409c')
                ;;
        x86_64) _uploadh='409271226'
                sha256sums+=('b19984711db368a6893d9afa09c6fe5a0b9186e5e7e950bd70e0a65017a68f3b')
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/-/jobs/${_uploadh}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
                ;;
esac

source=(${_uploadpath})

package() {
  # Yep, that's somewhat stupid.
  # Will hopefully be improved once the main librewolf-ci works properly.
  cp -r $srcdir/usr $pkgdir/
}
