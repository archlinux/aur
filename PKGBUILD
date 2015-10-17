# Maintainier: maz-1 < ohmygod19993 at gmail dot com >

_pkgname=kde-thumbnailer-blender
pkgname=${_pkgname}-kf5
pkgver=1.0
pkgrel=1
pkgdesc="Preview image generator plugin for Android Application Package files. KF5 Ver."                                                                                      
arch=('i686' 'x86_64')                                                                       
url="http://kde-apps.org/content/show.php?content=156421"                                                  
license=('GPL')                                                    
depends=('kdelibs4support' 'zlib')
makedepends=('cmake')
conflicts=("$_pkgname")
source=("http://kde-look.org/CONTENT/content-files/146380-kde-thumbnailer-blender_0.3kayosiii.tar.gz"
        "port_to_qt5.patch")
sha256sums=('b2162c1ea09103b87b7f6ee69725e8de972a4781fd442c34fd4b3346de878319' 'SKIP')

prepare() {
    cd "${srcdir}"/${_pkgname}
    patch -p1 < ../port_to_qt5.patch
}
build() {
  cd "${srcdir}"/${_pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr 
  make
}

package() {
  cd "${srcdir}"/${_pkgname}
  install -dm755 "${pkgdir}/usr/lib/qt/plugins"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/lib64/plugins"/* "${pkgdir}/usr/lib/qt/plugins"
  rm -r "${pkgdir}/usr/lib64"
}
