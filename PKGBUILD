# Maintainer Musikolo <musikolo {at} hotmail [dot] com>

pkgname=plasma5-applets-system-panel
pkgver=1.3.0
pkgdesc="Plasma5 applet that displays a panel with a set of system actions"
pkgrel=1
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php?content=175309"
license=(GPL3)
groups=('kde' 'plasmoid')
makedepends=(cmake extra-cmake-modules git)
depends=(plasma-workspace)
options=()
source=("git+https://github.com/Musikolo/${pkgname}.git")
md5sums=('SKIP')

prepare() {
  mkdir -p build

  msg2 "Switching to tag v${pkgver}..."
  cd "${pkgname}"
  git checkout -q tags/v${pkgver}
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="`kde4-config --prefix`" -DCMAKE_BUILD_TYPE=Release -DLIB_INSTALL_DIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON ../${pkgname}/src
  make
}

package() {
  pushd build
  make DESTDIR="${pkgdir}" install
  popd

  cd "${pkgname}"
  _licenses_dir="${pkgdir}`kde4-config --prefix`/share/licenses/${pkgname}"
  install -D AUTHORS "${_licenses_dir}/AUTHORS"
  install -D ChangeLog "${_licenses_dir}/ChangeLog"
  install -D LICENSE "${_licenses_dir}/LICENSE"
  install -D TODO "${_licenses_dir}/TODO"
}
