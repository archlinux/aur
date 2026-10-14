# Maintainer: Joydev GmbH (https://joydev.com)
#
# Template, not a finished PKGBUILD: `just publish-aur` fills the @...@
# fields from the published release, test-builds it and pushes the result
# with its .SRCINFO (JAPP-02EA-4A).
#
# Repackages the release .deb. Its binaries link the system webkit2gtk-4.1
# and bundle no libraries, so the app runs on Arch's own WebKit, Mesa and
# libwayland: the combination the AppImage broke. The -bin suffix is the
# AUR rule for prebuilt binaries; provides makes it the joyint-app package.

pkgname=joyint-app-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='Joyint App, the Joyint desktop app'
arch=('x86_64')
url='https://joyint.com/app'
license=('LicenseRef-Joydev-Proprietary')
depends=('cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'libsoup3' 'webkit2gtk-4.1' 'zlib')
provides=('joyint-app')
conflicts=('joyint-app')
options=('!strip' '!debug')
source=("joyint-app_0.7.1_amd64.deb::https://github.com/joyint/app-releases/releases/download/v0.7.1/joyint-app_0.7.1_amd64.deb"
        'LICENSE')
sha256sums=('7a16475bc28e62aba2fa8e5dac14797672d16ca9396019e13b78da3dbda2a57f'
            '9782c4c756f5ca8377020a36c6f26634746eea57c1219fb657ee48f4ac58898e')
noextract=("joyint-app_0.7.1_amd64.deb")

package() {
  bsdtar -xOf "joyint-app_0.7.1_amd64.deb" 'data.tar.*' | bsdtar -xf - -C "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
