# Maintainer: tocic <tocic at protonmail dot ch>
# Maintainer: Alad Wenter <alad@mailbox.org>
# Contributor: Tomáš Mládek <tmladek @ inventati doth ork>
# Contributor: shuall <shualloret @ gmail . com>

pkgname=chaiscript
pkgver=6.1.0
pkgrel=2
pkgdesc="An embedded scripting language for C++"
arch=("x86_64")
url="https://chaiscript.com"
license=("BSD")
depends=("gcc-libs")
makedepends=("cmake")
optdepends=("readline: command history support")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Chaiscript/Chaiscript/archive/v${pkgver}.tar.gz")
b2sums=("036796f3575fd1bf210425883f139120e2a6338df75bfd74de263d11f2443e5995250c1fe68068eaaa30a2871fc733d56e9bab9fd43e994ca407f9730c3e4d4d")

build() {
  cmake -B "build/" -S "ChaiScript-${pkgver}" \
    -D BUILD_MODULES:BOOL="OFF" \
    -D BUILD_TESTING:BOOL="OFF" \
    -D CMAKE_BUILD_TYPE:STRING="Release" \
    -D CMAKE_CXX_FLAGS_RELEASE:STRING="-O2 -DNDEBUG" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"

  install -D --target-directory="${pkgdir}/usr/share/licenses/${pkgname}/" \
    --mode=644 \
    "ChaiScript-${pkgver}/LICENSE"
}
