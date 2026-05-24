# Maintainer: kemal <kmal@cock.li>

pkgname=trivalent-bin
pkgver=148.0.7778.178
pkgrel=3
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
source=("https://repo.secureblue.dev/Packages/trivalent-148.0.7778.178-444892.x86_64.rpm" "https://repo.secureblue.dev/Packages/trivalent-qt6-ui-148.0.7778.178-444892.x86_64.rpm")
sha256sums=('0da2225cf698396ab2b1155e8934086abfc0f7298fffa8b27b9581c6f46db0cc' '9ae55806bf9c032ef320dcb9b7ad185a59938cf49ab2fe1986c0a0e77e6c6851')
prepare() {
	mv "${srcdir}/usr/lib64" "${srcdir}/usr/lib"
	sed -i 's/\[0-9\].so/[0-9]-arch[0-9].[0-9].so/' "${srcdir}/etc/trivalent/trivalent.conf"
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}/usr"
    cp -r "${srcdir}/etc/" "${pkgdir}/etc"
}
