# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>

pkgname=tmux-mem-cpu-load
pkgver=3.7.0
pkgrel=1
pkgdesc='CPU, RAM, and load monitor for use with tmux'
arch=('x86_64' 'aarch64')
url='https://github.com/thewtex/tmux-mem-cpu-load'
license=('Apache')
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz" "cpu-cstdint.patch")
b2sums=('61dfd556b22afd37d7011c2f31e1c1ee2632921c590ac273e92baf18f018d09eaffc628490d8c2bca973fc73dba67f83dfd380792c70f7fac8335cc9c732d7c3'
        '5f5c79d31e0aa6362c14bbc7d13e893bbabad427a1eee2a582b9c22667d29e7b889cc72fdbba13acf823faf8ac05ea980786e529aef72da7f8da0a497c0e71d5')

prepare() {
  ls
  patch --directory "${pkgname}-${pkgver}" --forward --strip 1 --input="${srcdir}/cpu-cstdint.patch"
}

build() {
  cmake -G Ninja -S "${pkgname}-${pkgver}" -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
  ninja -C build
}

package() {
  ninja -C build install
}
