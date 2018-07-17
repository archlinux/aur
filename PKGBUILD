# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='hello_wolrd_cpp_pkgbuild'
pkgver=r2.ba4f8df
pkgrel=1
pkgdesc="Hello World C++ PKGBUILD"
arch=('any')
url="https://gitlab.com/LinArcX/hello_wolrd_cpp_pkgbuild"
license=('GPL-3.0')

source=("${pkgname}::git+https://gitlab.com/LinArcX/hello_wolrd_cpp_pkgbuild.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"
  make # g++ -o helloworldcpp HelloWorld.cpp  # or make HelloWorld :)
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 hello-world-cpp-pkgbuild ${pkgdir}/usr/bin/hello-world-cpp-pkgbuild # what is install? see: man install
  chmod +x ${pkgdir}/usr/bin/hello-world-cpp-pkgbuild
}
