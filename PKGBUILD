# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=74.0.1
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
        aarch64) _uploadh='498668419'
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/-/jobs/${_uploadh}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst"
                sha256sums+=('efde19e0d20b3623861998be5bfb89cf9f32b56db47f5ced307f06decfc5989b')
                ;;
        x86_64) _uploadh='498622323'
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/-/jobs/${_uploadh}/artifacts/raw/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
                sha256sums+=('ed23d11e9eb04ceb54fd246d6bc94bf80186113b68e4f79773d6e147def23821')
                ;;
esac

source=(${_uploadpath})

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r $srcdir/usr $pkgdir/
}
