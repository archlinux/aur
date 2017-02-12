# Maintainer: Zhang Hai <dreaming.in.code.zh@gmail.com>

# Taken from android-studio

pkgname=android-studio-dummy
_pkgname=android-studio
pkgver=2.2.0.12
pkgrel=1
pkgdesc='A new Android development environment based on IntelliJ IDEA, dummy package'
arch=('i686' 'x86_64')
url='http://developer.android.com/sdk/installing/studio.html'
license=('APACHE')
depends_i686=('java-environment' 'python' 'ttf-font' 'fontconfig' 'libxrender' 'mesa')
depends_x86_64=('java-environment' 'python' 'ttf-font' 'lib32-fontconfig' 'lib32-libxrender'
                'lib32-mesa')
optdepends=('android-google-repository' 'android-platform' 'android-sdk' 'android-sdk-platform-tools' 'android-sdk-build-tools' 'android-source' 'android-support' 'android-support-repository' 'gtk2' 'libgl')
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
