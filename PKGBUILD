# Maintainer: Zhang Hai <dreaming.in.code.zh@gmail.com>

# Taken from android-studio

pkgname=android-studio-dummy
_pkgname=android-studio
pkgver=2.2.3.0
pkgrel=1
pkgdesc='The official Android IDE, dummy package'
arch=('i686' 'x86_64')
url='http://tools.android.com/'
license=('APACHE')
depends=('alsa-lib' 'freetype2' 'java-environment' 'libxrender' 'libxtst')
optdepends=('gtk2: GTK+ look and feel'
            'libgl: emulator support')
makedepends=('unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'android-studio-beta' 'android-studio-dev' 'android-studio-canary')
install="${pkgname}.install"
source=("${_pkgname}.desktop::https://aur.archlinux.org/cgit/aur.git/plain/${_pkgname}.desktop?h=${_pkgname}")
sha1sums=('357845775f3e2eb53c03ba96757c6b1e2c8baeb6')

prepare() {
  # Extract the application icon
  msg "Please extract Android Studio to /opt/${_pkgname}/ before building this package"
  unzip -qo "/opt/${_pkgname}/lib/resources.jar" 'artwork/icon_AS_128.png'
}

package() {
  install -d "${pkgdir}/usr/bin/"
  ln -s '/opt/android-studio/bin/studio.sh' "${pkgdir}/usr/bin/android-studio"
  install -Dm644 'artwork/icon_AS_128.png' "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
