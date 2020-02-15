# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=73.0
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
        aarch64) _uploadh='d676c03a2f42c51f816b05830f9bb716'
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/uploads/${_uploadh}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
                sha256sums+=('b744541388e1e78e08db3fed1c95ebbce85972d612fc81d8399d573441fc58ae')
                ;;
        x86_64) _uploadh='8a4baa82b402eff025493fecf7a5851f'
                sha256sums+=('dfcd8ee286b1812b096f81e7e158bbdb82c2a6fbf0775bd345d59bae3ad62338')
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/uploads/${_uploadh}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
                # _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/-/jobs/${_uploadh}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
                ;;
esac

source=(${_uploadpath})

package() {
  # Yep, that's somewhat stupid.
  # Will hopefully be improved once the main librewolf-ci works properly.
  cp -r $srcdir/usr $pkgdir/
}
