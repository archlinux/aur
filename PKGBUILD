# Maintainer: kemal <kmal@cock.li>

pkgname=trivalent-bin
pkgver=144.0.7559.59
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
source=("https://repo.secureblue.dev/Packages/trivalent-144.0.7559.59-442111.x86_64.rpm"
        "https://repo.secureblue.dev/Packages/trivalent-qt6-ui-144.0.7559.59-442111.x86_64.rpm")
sha256sums=('51acf3d809f46f624a351fb8cab0ecb9956ee5cdf962198d532f080d784b16b1'
            '3493be3a0c741542ab3aab813d810982276c2900fed51ebd8e7d1f2565da5d86')

prepare() {
	mv "${srcdir}/usr/lib64" "${srcdir}/usr/lib"
	# i dont see the cause of this, temporary fix
	sed -i 's/set -oue pipefail/set -ou pipefail' "${srcdir}/usr/lib/trivalent/trivalent.sh"
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}/usr"
    cp -r "${srcdir}/etc/" "${pkgdir}/etc"
}
