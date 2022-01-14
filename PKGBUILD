# Contributor: Eric Fung <loseurmarbles [at] gmail [dot] com>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Iwan Timmer <irtimmer@gmail.com>

pkgname=dbus-cpp
pkgdesc='A header-only dbus-binding leveraging C++-11'
pkgver=5.0.3
pkgrel=1
url='https://gitlab.com/ubports/core/lib-cpp/dbus-cpp'
arch=('x86_64' 'i686')
license=('LGPL3')
groups=('lib-cpp')
depends=('dbus' 'libxml2' 'process-cpp')
makedepends=('cmake' 'boost')
source=('https://gitlab.com/ubports/core/lib-cpp/dbus-cpp/-/archive/5.0.3/dbus-cpp-5.0.3.tar.gz')
sha256sums=('465ca23024c8f245d13a0afd454da17e6344d0c78941d99b7c9323a17f6e82ba')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -e '82d' -i CMakeLists.txt
}

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/_build"
  cd "${srcdir}/${pkgname}-${pkgver}/_build"

  cmake -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/_build"

  cmake --install . --prefix="${pkgdir}/usr"
}
