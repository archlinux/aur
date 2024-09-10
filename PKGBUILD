# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ivideon-server'
pkgver='3.14.0'
pkgrel='11543'
_rel='d694e54'
_libqt_name='libqt542-ivideon'
_libqt_ver='5.4.2.2'
pkgdesc='Ivideon Server (with QT5 GUI)'
arch=('x86_64')
url='https://ivideon.com'
license=('freeware')
depends=('ivideon-server-headless' 'qt5-base' 'qt5-multimedia' 'libsndfile' 'libxcb' 'libsm')
conflicts=('ivideon-video-server-nogui' 'ivideon-video-server')
noextract=("${source[@]%%::*}")
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/ivideon-video-server/ivideon-video-server_${pkgver}-${pkgrel}~${_rel}_amd64.deb"
	"https://packages.ivideon.com/ubuntu/pool/non-free/libq/${_libqt_name}/${_libqt_name}_${_libqt_ver}_amd64.deb"
	"${pkgname}_infinity_camera_list.patch")
sha256sums=('3b077a2f2792f7a49e9ffe0ce26da25893257695944661586f316065348185fa'
            '7863544a54e3d2e33b601b3939cc483ea1fd681a77a838d6e1896a91f75c194f'
            'a220cf727c7520d8c94fe11a28e7fb9a17614dff8f41343e35070c1ff59f754f')

build() {
  bsdtar xf "${srcdir}/ivideon-video-server_${pkgver}-${pkgrel}~${_rel}_amd64.deb"
  bsdtar xf "data.tar.xz"
  bsdtar xf "data.tar.gz"
  patch -p1 -i "${srcdir}/${pkgname}_infinity_camera_list.patch"
  cd "${srcdir}/opt/ivideon/${pkgname}"
  ln -fs ../qtlibs54/platforms platforms

  mkdir "${srcdir}/libqt54-ivideon"
  cd "${srcdir}/libqt54-ivideon"
  bsdtar xf "${srcdir}/${_libqt_name}_${_libqt_ver}_amd64.deb"
  bsdtar xf "data.tar.xz"
}

package() {
  cp -ax "${srcdir}/opt" "${pkgdir}"
  cp -ax "${srcdir}/usr" "${pkgdir}"
  cp -ax "${srcdir}/libqt54-ivideon/opt" "${pkgdir}"
}
