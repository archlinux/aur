# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=opensplice-dds
pkgver=5.5.1
pkgrel=1
pkgdesc="Enables seamless, timely, scalable and dependable data sharing between distributed applications and network connected devices."
arch=('i686' 'x86_64')
url="http://www.prismtech.com/opensplice"
license=('GPL')
depends=('java-environment' 'zlib')
source=(http://dev.opensplice.org/releases/downloads/releases/OpenSpliceDDSV${pkgver}-src.tar.gz)
md5sums=('ae70910701c19b2602e8cc9497bd74ea')
sha256sums=('8678779041fb3fa66d5c99da634c947fb18f501ec8501a099758c7711b4ed070')
sha384sums=('28a671b8a13ad271dbc1efc1311925aa41521ba0eae1fa9ba9f46874fa027a545044611b38675d00d364a59dcd3d9a68')
sha512sums=('2bd6474faf6dd7e5a60db2a2b87540aa474052a4adadd07e185acc24dde6c17e20411b28e2a047cee99633206fc07d958e5f43b6cb6b0e3162b265149b8d863e')
options=(!makeflags)


if [ "$CARCH" == "i686" ]; then
  _arch=x86.linux2.6
else
  _arch=x86_64.linux2.6
fi


build() {
  cd "${srcdir}/OpenSplice"

  source configure ${_arch}-release

  make

  cd install
  make
}

package() {
  cd "${srcdir}/OpenSplice/install/HDE/${_arch}"

  install -dm755 "${pkgdir}/usr/bin"
  cp -a bin/* "${pkgdir}/usr/bin/"

  install -dm755 "${pkgdir}/usr/lib"
  install -Dm644 lib/* "${pkgdir}/usr/lib/"

  install -dm755 "${pkgdir}/usr/include"
  cp -a include/* "${pkgdir}/usr/include/"

  install -dm755 "${pkgdir}/usr/share/opensplice"
  cp -a etc "${pkgdir}/usr/share/opensplice/"
  cp -a docs "${pkgdir}/usr/share/opensplice/"
  cp -a jar "${pkgdir}/usr/share/opensplice/"
  cp -a examples "${pkgdir}/usr/share/opensplice/"
}

