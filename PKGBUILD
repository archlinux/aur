# Maintainer Musikolo <musikolo {at} hotmail [dot] com>

pkgname=plasma6-applets-system-panel
_pkgname=plasma-applets-system-panel
pkgver=2.0.0
pkgdesc="Plasma 6 plasmoid that displays a panel with a set of system actions"
pkgrel=1
arch=(x86_64)
url="https://github.com/Musikolo/${_pkgname}"
license=(GPL3)
groups=('kde' 'plasmoid')
makedepends=(cmake extra-cmake-modules git)
depends=(plasma-workspace libkscreen)
conflicts=(plasma5-applets-system-panel)
source=("git+https://github.com/Musikolo/${_pkgname}.git")
sha256sums=('SKIP')

prepare() {
  mkdir -p build

  msg2 "Switching to tag v${pkgver}..."
  cd ${_pkgname}
  git checkout -q tags/v${pkgver}
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -DLIB_INSTALL_DIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON ../${_pkgname}/src
  make
}

package() {
  pushd build > /dev/null
  make DESTDIR="${pkgdir}" install
  popd > /dev/null

  cd "${_pkgname}"
  _licenses_dir="${pkgdir}/usr/share/licenses/${pkgname}"
  install -D AUTHORS "${_licenses_dir}/AUTHORS"
  install -D ChangeLog "${_licenses_dir}/ChangeLog"
  install -D LICENSE "${_licenses_dir}/LICENSE"
  install -D TODO "${_licenses_dir}/TODO"
}
