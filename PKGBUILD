# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_upstream_name=plasma-applet-ambientnoise
pkgname=plasma6-applets-ambientnoise
pkgver=0.6.0
pkgrel=1
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
)
conflicts=(plasma5-applets-ambientnoise)
source=("https://github.com/m-pilia/${_upstream_name}/archive/${pkgver}.tar.gz")
sha256sums=('2c60c03db9ea6f7e239cbae0759f5675b6cc6e533c6207527798d568d2aac1fe')

prepare() {
  cd "${srcdir}/${_upstream_name}-${pkgver}"

  cmake . \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd "${srcdir}/${_upstream_name}-${pkgver}"

  cmake --build build
}

package() {
  cd "${srcdir}/${_upstream_name}-${pkgver}"

  DESTDIR="$pkgdir" cmake --install build
  rm -rf "${pkgdir}"/usr/share/icons/*/icon-theme.cache
}
