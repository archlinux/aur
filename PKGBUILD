# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-android
pkgver=2019.2.0b9
pkgrel=1
pkgdesc="Allows building your Unity projects for the Android platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta'
         'android-platform'
         'android-sdk-build-tools'
         'android-udev')
optdepends=('android-ndk-16b: needed for IL2CPP builds')
makedepends=('cpio')
source=("2019.2.0b9.2.0b9.pkg::https://beta.unity3d.com/download/eabe87e2a246/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2019.2.0b9.pkg")
md5sums=("1afc171bf31b422be3df7e5620a38782")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/AndroidPlayer"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

