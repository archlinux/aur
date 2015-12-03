# Maintainer: maz-1 <ohmygod19993 at gmail dot com>

pkgname=kimtoy-frameworks-git
pkgver=20150824.ga4464f6
pkgdesc="Standalone input method panel. KF5 branch."
pkgrel=1
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KIMToy?content=140967"
license=('GPL')
makedepends=('cmake' 'fcitx' 'scim' 'dbus-c++' 'ibus' 'extra-cmake-modules' 'kdoctools')
depends=('kdelibs4support' 'ki18n' 'kio' 'knewstuff' 'karchive' 'kconfigwidgets' 'plasma-framework')
optdepends=('fcitx: fcitx support'
            'scim: scim support'
            'dbus-c++: scim support'
            'ibus: ibus support')
provides=kimtoy
conflicts=kimtoy
install=$pkgname.install
source=("git+https://github.com/ahyangyi/kimtoy.git#branch=kf5")

pkgver() {
	cd "$srcdir/kimtoy"
	echo "$(git show -s --format="%ci"|grep -oP '\d{4}-\d{2}-\d{2}'|sed 's:-::g').g$(git describe --always)"
}


prepare() {
  rm -rf build
  mkdir -p build
}


build() {
  cd "${srcdir}/build"

  cmake \
    -DIBUS_LIBEXEC_DIR='/usr/lib' \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF \
    ../kimtoy
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

md5sums=('SKIP')
