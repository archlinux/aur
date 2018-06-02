# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.1.2
_build=f1
_buildtag=20180504
_randomstring=3709a3f954c1
_prefix=/opt/Unity
_unitydownloads="http://beta.unity3d.com/download/${_randomstring}"
#_keepdownloads=yes

pkgname=unity-editor-standardassets
pkgver=${_version}${_build}+${_buildtag}
pkgrel=1
pkgdesc="Unity Standard Assets for easily getting started building projects in Unity."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('gtk2' 'libsoup' 'libarchive')
source=("${_unitydownloads}/UnitySetup-${_version}${_build}")
sha1sums=('8cb7bb1e3f753af55af8acceefad4ad26dd71b77')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

unity-setup() {
  ./UnitySetup-${_version}${_build} \
    --download-location="${startdir}" \
    --install-location="${pkgdir}${_prefix}" \
    --unattended $@
}

extract-component() {
  msg2 "Extracting $1..."
  yes | unity-setup --components=$1 > "/tmp/$1.log"
}

prepare() {
  chmod +x "${srcdir}/UnitySetup-${_version}${_build}"
}

package() {
  extract-component StandardAssets

  if [ -z "${_keepdownloads}" ]; then
    rm "${startdir}/StandardAssets.pkg"
  fi
}

