# Maintainer: redtide <redtid3 at gmail dot com>

pkgname=lxqt-appswitcher
_pkgver=1.0
pkgver=1.0.0
pkgrel=1
pkgdesc="Alternate, featureful application/window switcher for LXQT."
arch=("x86_64")
url="https://github.com/zjes/lxqt-appswitcher"
license=("LGPL2.1")
depends=("kwindowsystem" "liblxqt" "lxqt-globalkeys")
makedepends=("cmake" "lxqt-build-tools")
source=("${url}/archive/v1.0.tar.gz")
sha512sums=("d48b95a022c8b9350d1af396593fa91892060d89a374857f2d7a94b8556efe58ac48cac8c2796e030ba4b08944c1f19358648a7a7d4de96ea2b676ca4bf62256")
b2sums=("eebf5d4b789776e249156bed724104c4872b95c053d4abda4254aeaa1c13b60bb048231d615a5928fe0e0c2614ec4faddbcaad4b8bd16351aae1385ac3e6d95d")

build() {
  cd "$pkgname-$_pkgver"
  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE='None' \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  cd "$pkgname-$_pkgver"
  make VERBOSE=1 DESTDIR="$pkgdir/" install -C build
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
