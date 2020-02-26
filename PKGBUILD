# Maintainer: lsf

pkgname=librewolf-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
_pkgname=LibreWolf
pkgver=73.0.1
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
        aarch64) _uploadh='450964267'
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/-/jobs/${_uploadh}/artifacts/raw/ci/${pkgname//-bin/""}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.zst"
                sha256sums+=('dc933479b0ddd4b26695ddd851e168d3e5a6f57789989070961337c66f17e7f3')
                ;;
        x86_64) _uploadh='8f0174726c60c895d643ec7533a41858'
                sha256sums+=('84a82009d3aa727c3655c866980cf40a1b6338305f29307800bdacf44bbc9d9f')
                _uploadpath="https://gitlab.com/${pkgname//-bin/""}-community/browser/arch/uploads/${_uploadh}/${pkgname//-bin/""}-${pkgver}-${pkgrel}-${CARCH}.pkg.tar.xz"
                ;;
esac

source=(${_uploadpath})

package() {
  # Yep, that's somewhat stupid.
  # Will hopefully be improved once the main librewolf-ci works properly.
  cp -r $srcdir/usr $pkgdir/
}
