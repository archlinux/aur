# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=72.0.1
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
        aarch64) _uploadh='bacb893ba3cb0e38ab7fbc6908d99d4f'
                sha256sums+=('222e341aa9f5a985e2cedf746598588f9939eb67f81276a680cbe39ce0cc4c0d')
                ;;
        x86_64) _uploadh='e3718cfd1e6205a58b64dc9b94fbd69c'
                sha256sums+=('fc571167b23c0bef6b1d39ec70e977e766709338b9eb17442d5ad3c7f72cce2b')
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
