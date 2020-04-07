# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Marc Mettke <marc@itmettke.de>

pkgname=firefox-kde-opensuse-rpm
_pkgver=74.0.1-825.3
pkgver=${_pkgver/-/_}
pkgrel=2
epoch=1  # Because of update from 74.0-823.6 to 74.0.1-824.1
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE - Binary from OBS"
arch=(x86_64 i686)
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
#not the same release cycle: source_armv7h=("https://download.opensuse.org/repositories/mozilla:/Factory/openSUSE_Factory_ARM/armv7hl/MozillaFirefox-${_pkgver}.armv7hl.rpm")  # not tested
#not the same release cycle: source_aarch64=("https://download.opensuse.org/repositories/mozilla:/Factory/openSUSE_Factory_ARM/aarch64/MozillaFirefox-${_pkgver}.aarch64.rpm")  # not tested

sha512sums_x86_64=('8314529f13ca86c1d2736027a4bca894c73554cea7d6dd36e6767afd62db30ad09c3655ed9ecc9b0a267a9c6701eb6d29e7f29230a62248d49eec985f4af4c0a')
sha512sums_i686=('c99bbfe3a524ace252b63e4c9c107c8b4142b5ac011121d84db1d2686b1642d6c46d9e517801b4e6b91e092941ae092f88b10dd48ee91604b07a6b9622828a33')


package() {
    cd "usr"
    
    install -d "${pkgdir}/usr/share" "${pkgdir}/usr/lib"
    
    install -Dm755 "bin/firefox" "${pkgdir}/usr/bin/firefox"
    cp -r share/{applications,icons,man,mime} "${pkgdir}/usr/share/"
    cp -r lib64/firefox "${pkgdir}/usr/lib/"
}
