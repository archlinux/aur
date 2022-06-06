# Maintainer:  Antonio Vázquez <antoniovazquezblanco@gmail.com>

pkgname=plctool-plugins-git
pkgver=v1.1.0.r0.gd9ef4de
pkgrel=1
pkgdesc="Blink attack plugin for PLCTool"
arch=('i686' 'x86_64')
license=("GPL")
url="https://github.com/TarlogicSecurity/PLCTool-BlinkAttackPlugin"
source=("${pkgname}::git+https://github.com/TarlogicSecurity/PLCTool-Plugins.git")
sha256sums=('SKIP')
depends=('qt6-base')
makedepends=('git')
provides=('plctool-plugins')
conflicts=('plctool-plugins')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  qmake "${srcdir}/${pkgname}" PREFIX=/usr PLCTOOL_PREFIX=/usr
  make -j$(nproc)
}

package() {
  cd "${srcdir}/build"
  make install INSTALL_ROOT="$pkgdir"
}

