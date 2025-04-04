# Maintainer: kemal <kmal@cock.li>

pkgname=trivalent-bin
pkgver=135.0.7049.52
pkgrel=2
pkgdesc="A hardened chromium for desktop Linux inspired by Vanadium."
arch=('x86_64')
url="https://github.com/secureblue/Trivalent"
license=('(GPL-2.0-only WITH (Apache-2.0-note AND FTL-note AND WebView-note)) AND BSD-3-Clause AND LGPL-2.1-or-later AND Apache-2.0 AND IJG AND MIT AND GPL-2.0-or-later AND ISC AND OpenSSL AND (MPL-1.1 OR GPL-2.0-only OR LGPL-2.0-only)')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme' 'brotli' 'flac'
         'fontconfig' 'freetype2' 'harfbuzz' 'icu' 'libjpeg-turbo' 'libpng'
         'libwebp' 'libxml2' 'libxslt' 'opus' 'minizip' 'bubblewrap')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma'
            'upower: Battery Status API support'
            'qt6-base: QT UI support')
source=("https://repo.secureblue.dev/Packages/trivalent-135.0.7049.52-435910.x86_64.rpm"
        "https://repo.secureblue.dev/Packages/trivalent-common-135.0.7049.52-435910.x86_64.rpm"
        "https://repo.secureblue.dev/Packages/trivalent-qt6-ui-135.0.7049.52-435910.x86_64.rpm")
sha256sums=('1d87f113465c8d6a18c807a288a6582ccaea62a794f83bff3d92b9d5a1f6c2b8'
            '31cdd94b2bc3e0d59ffb06e0319e9895f27530a48ad17e16abd06a7e8050f373'
            'ad53f1b352ef04a908d6cd353eb2f586188026812649b30bbf742fb59a26d519')

prepare() {
	mv "${srcdir}/usr/lib64" "${srcdir}/usr/lib"
	sed -i 's/$(arch)/$(uname -m)/' "${srcdir}/etc/trivalent/trivalent.conf"
	patch -Np2 -d "${srcdir}/usr/lib/" -i only-bind-ld-so-preload-if-it-exists.patch
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}/usr"
    cp -r "${srcdir}/etc/" "${pkgdir}/etc"
}
