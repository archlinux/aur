# Maintainer:  Antonio Vázquez <antoniovazquezblanco@gmail.com>

pkgname=plctool-git
pkgver=v1.1.0.r0.ga4c1ac2
pkgrel=1
pkgdesc="A PRIME/DLMS graphical swiss-knife"
arch=('i686' 'x86_64')
license=("GPL")
url="https://github.com/TarlogicSecurity/PLCTool"
source=("${pkgname}::git+https://github.com/TarlogicSecurity/PLCTool.git")
sha256sums=('SKIP')
depends=('qt6-base')
makedepends=('git')
provides=('plctool')
conflicts=('plctool')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  qmake "${srcdir}/${pkgname}" PREFIX=/usr
  make -j$(nproc)
}

package() {
  cd "${srcdir}/build"
  make install INSTALL_ROOT="$pkgdir"
}

