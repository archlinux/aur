# Maintainer: Zhang Hai <dreaming.in.code.zh@gmail.com>

# Taken from android-studio

pkgname=android-studio-dummy
_pkgname=android-studio
pkgver=2.1.0.9
pkgrel=1
pkgdesc='A new Android development environment based on IntelliJ IDEA, dummy package'
arch=('i686' 'x86_64')
url='http://developer.android.com/sdk/installing/studio.html'
license=('APACHE')
depends_i686=('java-environment' 'python' 'ttf-font' 'fontconfig' 'libxrender' 'mesa')
depends_x86_64=('java-environment' 'python' 'ttf-font' 'lib32-fontconfig' 'lib32-libxrender'
                'lib32-mesa')
optdepends=('android-google-repository' 'android-platform' 'android-sdk' 'android-sdk-platform-tools' 'android-sdk-build-tools' 'android-source' 'android-support' 'android-support-repository')
makedepends=('unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}" 'android-studio-beta' 'android-studio-dev' 'android-studio-canary')
install="${pkgname}.install"
source=("${_pkgname}.desktop::https://aur.archlinux.org/cgit/aur.git/plain/${_pkgname}.desktop?h=${_pkgname}")
sha512sums=('7c1ab152b3f26a0a4796c085bb7bf66aa4711a010910636c0c82a37609155c819b21a732fc3874b55e7d443c989c46f29d51ed54538795829c8eb835308b5aaa')

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
