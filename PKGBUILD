# Maintainer: kemal <kmal@cock.li>

pkgname=trivalent-bin
pkgver=135.0.7049.95
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
source=("https://repo.secureblue.dev/Packages/trivalent-135.0.7049.95-436191.x86_64.rpm"
        "https://repo.secureblue.dev/Packages/trivalent-common-135.0.7049.95-436191.x86_64.rpm"
        "https://repo.secureblue.dev/Packages/trivalent-qt6-ui-135.0.7049.95-436191.x86_64.rpm")
sha256sums=('145e5dc4410f9a80c4f418efb77ff095fa7ea5fd38610eec889460f25b7ee3fd'
            '045bd13dba7408ee05c16501edfed3bd2b42696773b4bdadcf6b0ff24b2ce98c'
            '8dc3c873b986f157e1ee59224325f9990d5d0416a97e36049cb3ecd74360fa0a')

prepare() {
	mv "${srcdir}/usr/lib64" "${srcdir}/usr/lib"
	sed -i 's/$(arch)/$(uname -m)/' "${srcdir}/etc/trivalent/trivalent.conf"
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}/usr"
    cp -r "${srcdir}/etc/" "${pkgdir}/etc"
}
