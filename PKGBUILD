# Maintainer: kemal <kmal@cock.li>

pkgname=trivalent-bin
pkgver=137.0.7151.55
pkgrel=1
pkgdesc="A hardened chromium for desktop Linux inspired by Vanadium."
arch=('x86_64')
url="https://github.com/secureblue/Trivalent"
license=('(GPL-2.0-only WITH (Apache-2.0-note AND FTL-note AND WebView-note)) AND BSD-3-Clause AND LGPL-2.1-or-later AND Apache-2.0 AND IJG AND MIT AND GPL-2.0-or-later AND ISC AND OpenSSL AND (MPL-1.1 OR GPL-2.0-only OR LGPL-2.0-only)')
depends=('gtk4' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme' 'brotli' 'flac'
         'fontconfig' 'freetype2' 'harfbuzz' 'icu' 'libjpeg-turbo' 'libpng'
         'libwebp' 'libxml2' 'libxslt' 'opus' 'minizip' 'bubblewrap')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk3: legacy'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma'
            'upower: Battery Status API support'
            'qt6-base: QT UI support')
source=("https://repo.secureblue.dev/Packages/trivalent-137.0.7151.55-437097.x86_64.rpm"
        "https://repo.secureblue.dev/Packages/trivalent-common-137.0.7151.55-437097.x86_64.rpm"
        "https://repo.secureblue.dev/Packages/trivalent-qt6-ui-137.0.7151.55-437097.x86_64.rpm")
sha256sums=('209fc3b251e08d9733bca14574f1dc9539212401f5191d51b2c24657c6ac62c7'
            '348186635544e13947ffaed877e055d09b0d478c1c0bee1cfe9952c151cd72f8'
            '0b2c6ff24d27c969269bab3e0515ee37d67a1cb3ca9a9403c03e68f3d83e4d8b')

prepare() {
	mv "${srcdir}/usr/lib64" "${srcdir}/usr/lib"
	sed -i 's/$(arch)/$(uname -m)/' "${srcdir}/etc/trivalent/trivalent.conf"
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}/usr"
    cp -r "${srcdir}/etc/" "${pkgdir}/etc"
}
