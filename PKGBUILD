# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=74.0
pkgrel=2
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
        aarch64) _uploadh='6aa66ba3483dbe62890c3c966c5555bb'
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst"
                sha256sums+=('ce281ea36365b95805b3e8d2a0c21c3b9fc7964b974aa46363836ea7228fec19')
                ;;
        x86_64) _uploadh='123be141eb11d11a8ce650fa48aa96e0'
                sha256sums+=('aed40991a0a0531c78399c559d641d0412166467eca367060e94cfa11c8a3f1a')
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/linux/uploads/${_uploadh}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
                ;;
esac

source=(${_uploadpath})

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r $srcdir/usr $pkgdir/
}
