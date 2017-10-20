# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=android-sdk-ant
pkgver=25.2.5
pkgrel=3
pkgdesc='Apache Ant build scripts and libraries for the Android SDK'
arch=('any')
url='https://developer.android.com/studio/releases/sdk-tools.html'
license=('custom')
depends=('android-sdk>=25.3.0')
source=("https://dl.google.com/android/repository/tools_r${pkgver}-linux.zip"
        'LICENSE')
sha256sums=('577516819c8b5fae680f049d39014ff1ba4af870b687cab10595783e6f22d33e'
            'b9ee34b4522a15c244a7f90d269bde1414f1064eba9d500f8a24ba22ead0446f')

package() {
  cd "${srcdir}"

  local LIBS=(
    'ant-tasks.jar'
    'common.jar'
    'emma_ant.jar'
    'emma_device.jar'
    'emma.jar'
    'gson-2.2.4.jar'
    'guava-17.0.jar'
    'guava-18.0.jar'
    'manifest-merger.jar'
    'sdklib.jar')

  for FILE in "tools/ant"/*; do
    install -Dm644 "$FILE" "${pkgdir}"/opt/android-sdk/tools/ant/$(basename $FILE)
  done

  for LIB in ${LIBS[@]}; do
    install -Dm644 tools/lib/${LIB} "${pkgdir}"/opt/android-sdk/tools/lib/${LIB}
  done

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
