# Package maintainer: Martino Pilia <martino.pilia@gmail.com>
_upstream_name=plasma-applet-ambientnoise
pkgname=plasma5-applets-ambientnoise
pkgver=0.5.0
pkgrel=2
pkgdesc="Plasmoid for ambient noise reproduction"
arch=('any')
url="https://github.com/m-pilia/plasma-applet-ambientnoise"
license=('GPL')
depends=('plasma-workspace')
optdepends=('anoise-media: noise files and icons'
            'anoise-community-extension1: noise files and icons'
            'anoise-community-extension2: noise files and icons'
            'anoise-community-extension3: noise files and icons'
            'anoise-community-extension4: noise files and icons'
            'anoise-community-extension5: noise files and icons')
makedepends=(
    'extra-cmake-modules'
    'git'
    'kdelibs4support'
)
source=("https://github.com/m-pilia/${_upstream_name}/archive/${pkgver}.tar.gz")
sha256sums=('d0936c0273b2877545edecb06316eed99ae4225b0bf1a889262e42ac5abaa314')

prepare() {
  export _build_dir="${srcdir}/${_upstream_name}-${pkgver}"/build

  mkdir "${_build_dir}" || :
  cd "${_build_dir}"
  cmake .. -DCMAKE_INSTALL_PREFIX="$(kf5-config --prefix)" \
           -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd "${_build_dir}"
  make
}

package() {
  cd "${_build_dir}"
  make install DESTDIR="${pkgdir}"
  rm -rf "${pkgdir}"/usr/share/icons/*/icon-theme.cache
}
