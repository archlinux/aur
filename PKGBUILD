# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2017.3.0
_build=p2
_buildtag=20180117
_randomstring=7807bc63c3ab
_prefix=/opt/Unity
_unitydownloads="http://beta.unity3d.com/download/${_randomstring}"
#_keepdownloads=yes

pkgname=unity-editor-ios
pkgver=${_version}${_build}+${_buildtag}
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('gtk2' 'libsoup' 'libarchive')
source=("${_unitydownloads}/UnitySetup-${_version}${_build}")
sha1sums=('ed56e42d211732e37fa84aa31b0d3eb2c92b177d')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

unity-setup() {
  ./UnitySetup-${_version}${_build} -d "${startdir}" -l "${pkgdir}${_prefix}" -u $@
}

extract-component() {
  msg2 "Extracting $1..."
  yes | unity-setup -c $1 > "/tmp/$1.log"
}

prepare() {
  chmod +x "${srcdir}/UnitySetup-${_version}${_build}"
}

package() {
  mkdir -p "${pkgdir}${_prefix}"
  extract-component iOS

  if [ -z "${_keepdownloads}" ]; then
    rm "${startdir}/UnitySetup-iOS-Support-for-Editor-${_version}${_build}.tar.xz"
  fi
}

