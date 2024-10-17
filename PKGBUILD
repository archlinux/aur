# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

# Taken from android-studio

_pkgname=android-studio
pkgname="${_pkgname}-dummy"
pkgver=2024.2.1.10
pkgrel=1
_pkgdesc='The official Android IDE'
pkgdesc="${_pkgdesc}, dummy package"
arch=('i686' 'x86_64')
url='https://developer.android.com/'
license=('APACHE')
depends=('alsa-lib' 'freetype2' 'libxrender' 'libxtst' 'which')
optdepends=('gtk2: GTK+ look and feel'
            'libgl: emulator support'
            'ncurses5-compat-libs: native debugger support')
makedepends=('unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-beta" "${_pkgname}-canary" "${_pkgname}-dev")
install="${pkgname}.install"
source=("${_pkgname}.desktop::https://aur.archlinux.org/cgit/aur.git/plain/${_pkgname}.desktop?h=${_pkgname}")
sha256sums=('73cd2dde1d0f99aaba5baad1e2b91c834edd5db3c817f6fb78868d102360d3c4')

if [ "$CARCH" = "i686" ]; then
    depends+=('java-environment')
fi

prepare() {
  # Extract the application icon
  msg "Please extract Android Studio to /opt/${_pkgname}/ before building this package"
  unzip -qo "/opt/${_pkgname}/lib/resources.jar" 'artwork/icon_AS_128.png'
}

package() {
  install -d "${pkgdir}/usr/bin/"
  ln -s '/opt/android-studio/bin/studio' "${pkgdir}/usr/bin/android-studio"
  install -Dm644 'artwork/icon_AS_128.png' "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
