# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: dhamp <dhamp@ya.ru>

pkgname=eiskaltdcpp-web-git
pkgver=1.0.1.1.ga252fa1
pkgrel=1
pkgdesc="Web interface for EiskaltDC++ Daemon. (GIT Version)"
license=('GPL3')
arch=('any')
url='https://github.com/eiskaltdcpp/eiskaltdcpp-web'
depends=('eiskaltdcpp-daemon'
         'sh'
         )
makedepends=('git')
conflicts=('eiskaltdcpp-web')
provides=('eiskaltdcpp-web')
options=('!emptydirs')
source=('git+https://github.com/eiskaltdcpp/eiskaltdcpp-web'
        'eiskaltdcpp-web.sh'
        )
sha256sums=('SKIP'
            '1bf98f045ee32a021011d82eddba4787198a66b104c3183279ca1c8e71bf321b'
            )
backcup=('usr/share/webapps/Eiskaltdcpp-web/config.js')

pkgver() {
  cd eiskaltdcpp-web
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  sed 's|eiskaltdcpp/web|webapps/Eiskaltdcpp-web|g' -i eiskaltdcpp-web/CMakeLists.txt
}

build() {
  cmake -S eiskaltdcpp-web -B build \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install

  install -Dm755 "${srcdir}/eiskaltdcpp-web.sh" "${pkgdir}/usr/bin/eiskaltdcpp-web"
}
