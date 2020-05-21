# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=corestuff
pkgver=2.9.0
pkgrel=2
pkgdesc="An activity viewer from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'libxcomposite' 'kglobalaccel' 'libcsys>=2.7.1' 'libcprime>=2.7.1')
makedepends=('git')
replaces=('corebox')
groups=('coreapps')
source=( #"https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
		"git+https://gitlab.com/cubocore/$pkgname.git#tag=v2.9.0")
md5sums=('SKIP')

prepare() {
  mkdir -p build
  cd ${pkgname}
  git submodule update --init --recursive
}

build() {
  cd ${pkgname}

  qmake-qt5 ${pkgname}.pro
  make
}

package() {
  cd ${pkgname}
  make INSTALL_ROOT=${pkgdir} install
} 
