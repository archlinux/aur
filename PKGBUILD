# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=luajit-decompiler-git
_pkgname=luajit-decompiler
pkgver=r36.072a766
pkgrel=1
pkgdesc="LuaJIT 字节码反编译器"
arch=('x86_64')
url="https://github.com/PackageInstaller/luajit-decompiler"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git')
provides=('luajit-decompiler')
conflicts=('luajit-decompiler')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build -j
}

check() {
  cd "${srcdir}/${_pkgname}"
  ./build/luajit-decompiler -? >/dev/null
}

package() {
  cd "${srcdir}/${_pkgname}"
  cmake --install build --prefix "${pkgdir}/usr"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
