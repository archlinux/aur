# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=76.0.1
pkgrel=1
pkgdesc="Community-maintained fork of Firefox, focused on privacy, security and freedom."
arch=(x86_64 aarch64)
license=(MPL GPL LGPL)
url="https://librewolf-community.gitlab.io/"
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!emptydirs)

case "$CARCH" in
        aarch64) _uploadh='544612718'
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/-/jobs/${_uploadh}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst"
                sha256sums+=('78aa583e64767025db5bfbb523a139535f8b2fe6cf7cb206bb975428ac7c92ab')
                ;;
        x86_64) _uploadh='544984787'
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/-/jobs/${_uploadh}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
                sha256sums+=('90b89d65455854060de0677c03617d36705853474a30925f6f7d85260b95e6cc')
                ;;
esac

source=(${_uploadpath})

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r $srcdir/usr $pkgdir/
}
