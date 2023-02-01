# Copyright (C) 2020  Matthew "strager" Glazar
# See end of file for extended copyright information.

# Maintainer: Matthew "strager" Glazar <strager.nds@gmail.com>
# Contributor: Shivam Mehta <sm.cse at gmail dot com>

pkgname=quick-lint-js
pkgver=2.11.0
pkgrel=1
pkgdesc="Find bugs in JavaScript programs"
arch=(aarch64 arm armv6h armv7h i686 pentium4 x86_64)
url="https://quick-lint-js.com/"
license=(Apache Boost GPL3)
depends=(gcc-libs hicolor-icon-theme)
makedepends=(cmake gcc ninja)
checkdepends=(icu)
provides=()
conflicts=(quick-lint-js)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://c.quick-lint-js.com/releases/${pkgver}/source/quick-lint-js-${pkgver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz.asc::https://c.quick-lint-js.com/releases/${pkgver}/source/quick-lint-js-${pkgver}.tar.gz.asc"
)
sha512sums=('32053ce8a8e29b66018aac51730e97a1679639a7a6a12e8e42fd07fd21757341704a9c2056b4c35b1fdcd9c70c3ff3ae6872f44b2390d5f8287c854b652e6651'
            'SKIP')
# Matthew "strager" Glazar <strager.nds@gmail.com>
validpgpkeys=(A6851D57A65803E98C05DA01C08A7BC89CA2F557)
options=(lto)

build() {
  cd "${pkgname}-${pkgver}"
  cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=YES \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQUICK_LINT_JS_INSTALL_LICENSES_DIR="share/licenses/${pkgname}" \
    -S . -B build
  ninja -C build
}

check() {
  cd "${pkgname}-${pkgver}/build"
  ctest --output-on-failure
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}/" ninja -C build install
}

# quick-lint-js finds bugs in JavaScript programs.
# Copyright (C) 2020  Matthew "strager" Glazar
#
# This file is part of quick-lint-js.
#
# quick-lint-js is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# quick-lint-js is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with quick-lint-js.  If not, see <https://www.gnu.org/licenses/>.
