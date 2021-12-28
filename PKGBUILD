# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ivideon-server'
pkgver='3.12.0'
pkgrel='8015'
_rel='5d26cf0'
pkgdesc='Ivideon Server (with QT5 GUI)'
arch=('x86_64')
url='https://ivideon.com'
license=('freeware')
depends=('ivideon-server-headless' 'qt5-base' 'qt5-multimedia' 'libsndfile' 'libxcb' 'libsm')
conflicts=('ivideon-video-server-nogui' 'ivideon-video-server')
noextract=("${source[@]%%::*}")
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/ivideon-video-server/ivideon-video-server_${pkgver}-${pkgrel}~${_rel}_amd64.deb"
	"https://packages.ivideon.com/ubuntu/pool/non-free/libq/libqt54-ivideon/libqt54-ivideon_5.4.2.0_amd64.deb"
	"${pkgname}_infinity_camera_list.patch")
sha256sums=('5cdd8beef3d0f5b1cb84ae2ba8c04d40aa58060d801e857bc53c6dba51e810d8'
            'cbc6481b30a058a2bd8707bfaa06d600ce7be0304140a92ac56340ae13b1e062'
            'a220cf727c7520d8c94fe11a28e7fb9a17614dff8f41343e35070c1ff59f754f')

build() {
  cd "${srcdir}"
  bsdtar xf "${srcdir}/ivideon-video-server_${pkgver}-${pkgrel}~${_rel}_amd64.deb"
  bsdtar xf "data.tar.xz"
  patch -p1 -i "${srcdir}/${pkgname}_infinity_camera_list.patch"
  cd "${srcdir}/opt/ivideon/${pkgname}"
  ln -fs ../qtlibs54/platforms platforms

  mkdir "${srcdir}/libqt54-ivideon"
  cd "${srcdir}/libqt54-ivideon"
  bsdtar xf "${srcdir}/libqt54-ivideon_5.4.2.0_amd64.deb"
  bsdtar xf "data.tar.xz"
}

package() {
  cp -ax "${srcdir}/opt" "${pkgdir}"
  cp -ax "${srcdir}/usr" "${pkgdir}"
  cp -ax "${srcdir}/libqt54-ivideon/opt" "${pkgdir}"
}
