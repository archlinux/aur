# Maintainer: kemal <kmal@cock.li>

pkgname=trivalent-bin
pkgver=136.0.7103.59
pkgrel=2
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
source=("https://repo.secureblue.dev/Packages/trivalent-136.0.7103.59-436509.x86_64.rpm"
        "https://repo.secureblue.dev/Packages/trivalent-common-136.0.7103.59-436509.x86_64.rpm"
        "https://repo.secureblue.dev/Packages/trivalent-qt6-ui-136.0.7103.59-436509.x86_64.rpm")
sha256sums=('385cfcf3c29c7b5b25296f102c7e4a75d042464c205ff51aec7eb278cc408d05'
            '17395e8d1f810da7d9dc1698f00864ba19194ef6e3542cb5f2b3f5525f4119cb'
            '3cecd33b625ac14e9e293a22cd134bd1f5cb5c13d04d847215dfe8b22ac1c682')

prepare() {
	mv "${srcdir}/usr/lib64" "${srcdir}/usr/lib"
	sed -i 's/$(arch)/$(uname -m)/' "${srcdir}/etc/trivalent/trivalent.conf"
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}/usr"
    cp -r "${srcdir}/etc/" "${pkgdir}/etc"
}
