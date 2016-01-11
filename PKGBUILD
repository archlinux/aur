# Maintainer: Wojciech Szymecki <w.szymecki-at-g;mail-com>
pkgname="autojsoncxx-git"
pkgver=0.3.0.r42.gf6b171a
pkgrel=1
arch=('any')
url="https://netheril96.github.io/autojsoncxx/"
license=('MIT')
depends=('python' 'rapidjson')
makedepends=('cmake' 'git')
optdepends=('python-parsimonious: for type checks'
            'boost: to use boost types')
source=("${pkgname}::git+https://github.com/netheril96/autojsoncxx.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  git submodule init
  git submodule update
}

build() {
    cd "${pkgname}"
    cmake -G 'Unix Makefiles' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        .
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
