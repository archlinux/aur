# Maintainer: kemal <kmal@cock.li>

pkgname=trivalent-bin
pkgver=146.0.7680.80
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
source=("https://repo.secureblue.dev/Packages/trivalent-146.0.7680.80-443404.x86_64.rpm"
        "https://repo.secureblue.dev/Packages/trivalent-qt6-ui-146.0.7680.80-443404.x86_64.rpm")
sha256sums=('4cdc4564c147eca369a3081ff0fdcd283e2c50918b1c0e224425383b04077cb0'
            'e46f617f1f88f30f10c0cb3feb898ac3f60e8bcfc47044e6d0d6ba783f8b3aeb')

prepare() {
	mv "${srcdir}/usr/lib64" "${srcdir}/usr/lib"
	sed -i 's/\[0-9\].so/[0-9]-arch[0-9].[0-9].so/' "${srcdir}/etc/trivalent/trivalent.conf"
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}/usr"
    cp -r "${srcdir}/etc/" "${pkgdir}/etc"
}
