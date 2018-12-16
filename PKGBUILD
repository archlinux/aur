# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-android
pkgver=2018.2.20f1
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
optdepends=('android-ndk-13b: needed for IL2CPP builds')
source=("https://download.unity3d.com/download_unity/cef3e6c0c622/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2018.2.20f1.pkg")
md5sums=("9070ba86ab364fc53152d0219474dfe9")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/AndroidPlayer"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

