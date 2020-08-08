# Mantainer maz-1 < ohmygod19993 at gmail dot com >
pkgname=kcm-imchooser-frameworks
pkgver=0.1
pkgrel=2
pkgdesc="A input method starter and configure tool. It can help you set annoying system environment variable. Unofficial KF5 port."
arch=('x86_64')
url='http://kde-apps.org/content/show.php/kcm+imchooser?content=146776'
license=('GPL')
provides=("kcm-imchooser")
conflicts=("kcm-imchooser")
install=kcm-imchooser.install
depends=('qt5-base'
         'kio' 'kdelibs4support')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
source=("git+https://github.com/maz-1/kcm_imchooser#tag=0.1"
        "imchooser-helper.sh"
        "imchooser-helper.service")
groups=('plasma')
md5sums=('SKIP'
         'SKIP'
         'SKIP')

         
build() {
  mkdir -p build
  cd build
  cmake ../kcm_imchooser \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir/imchooser-helper.sh" "$pkgdir/usr/share/imchooser/imchooser-helper"
  install -Dm755 "$srcdir/imchooser-helper.service" "$pkgdir/usr/lib/systemd/system/imchooser-helper.service"
}
