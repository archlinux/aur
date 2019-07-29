# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-android
pkgver=2019.1.12f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Android platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor'
         'android-platform'
         'android-sdk-build-tools'
         'android-udev')
makedepends=('cpio')
optdepends=('android-ndk-16b: needed for IL2CPP builds')
source=("2019.1.12f1.1.12f1.pkg::https://download.unity3d.com/download_unity/f04f5427219e/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2019.1.12f1.pkg")
md5sums=("bf747641bdf45f6742dc1fa8d6864e8b")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/AndroidPlayer"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

