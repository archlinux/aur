# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Marc Mettke <marc@itmettke.de>

pkgname=firefox-kde-opensuse-rpm
_pkgver=74.0.1-824.1
pkgver=${_pkgver/-/_}
pkgrel=2
epoch=1  # Because of update from 74.0-823.6 to 74.0.1-824.1
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE - Binary from OBS"
arch=(x86_64 i686 aarch64)
license=("MPL" "GPL" "LGPL")
url="https://build.opensuse.org/package/show/mozilla:Factory/MozillaFirefox"
depends=("mozilla-common" "startup-notification" "mime-types"
         "dbus-glib"
         "libvpx"  "libevent" "hunspell"
         "libnotify" "kmozillahelper" "ffmpeg" "gtk3" "gtk2"
         # system av1
         "dav1d" "aom"
         # system webp
         "libwebp"
         # system libevent
         "libevent"
        )
optdepends=("networkmanager: Location detection via available WiFi networks"
            "speech-dispatcher: Text-to-Speech")
provides=("firefox=${pkgver}")
conflicts=("firefox" "firefox-kde-opensuse")
options=()

source_x86_64=("https://download.opensuse.org/repositories/mozilla:/Factory/openSUSE_Factory/x86_64/MozillaFirefox-${_pkgver}.x86_64.rpm")
source_i686=("https://download.opensuse.org/repositories/mozilla:/Factory/openSUSE_Factory/i686/MozillaFirefox-${_pkgver}.i686.rpm")  # not tested
#currently dead: source_armv7h=("https://download.opensuse.org/repositories/mozilla:/Factory/openSUSE_Factory_ARM/armv7hl/MozillaFirefox-${_pkgver}.armv7hl.rpm")  # not tested
source_aarch64=("https://download.opensuse.org/repositories/mozilla:/Factory/openSUSE_Factory_ARM/aarch64/MozillaFirefox-${_pkgver}.aarch64.rpm")  # not tested

sha512sums_x86_64=('c9e5b0bed8645622173e0fe4933c0a1d69246a98e7350c401dfbf2683dcbcf098f9dae6eb0d5f70fd8a33c4dd6b17e5202ea91290f3bef8112f77a36de862845')
sha512sums_i686=('37f844b9bf1ba3ea63c659bbffc247559cfce1024a549343d5a98482017d1a087d7f1fa839694dde6e37af306364b6ff60f06d510e79eac774fdba9e58cae53d')
sha512sums_aarch64=('01d2f1e2e0d2dcd0ed9d7f17513e9ef300fa72ae2dda962950f212ea120e055678625968014722d150b8cf89fe5339a28a24b3cd4b5509b74988954251202c1f')

package() {
    cd "usr"
    
    install -d "${pkgdir}/usr/share" "${pkgdir}/usr/lib"
    
    install -Dm755 "bin/firefox" "${pkgdir}/usr/bin/firefox"
    cp -r share/{applications,icons,man,mime} "${pkgdir}/usr/share/"
    cp -r lib64/firefox "${pkgdir}/usr/lib/"
}
