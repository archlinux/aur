# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=75.0
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
        aarch64) _uploadh='502188942'
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/-/jobs/${_uploadh}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst"
                sha256sums+=('e678f96a2f4ff2875f4f5d9dc93130a0093695074285bc8373d7350a6b722f2a')
                ;;
        x86_64) _uploadh='502188941'
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/-/jobs/${_uploadh}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
                sha256sums+=('a886d34613144ac68e26f5ba1aab436dbf7a07487ce2c3eb8d84e1229b42dd04')
                ;;
esac

source=(${_uploadpath})

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r $srcdir/usr $pkgdir/
}
