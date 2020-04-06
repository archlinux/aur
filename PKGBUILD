#
# PKGBUILD for package nullpomino
#
# Copyright (c) 2020 Carson Black <uhhadd AT email DOT com>
#
# The license governing this build recipe is the MIT license.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
# of the Software, and to permit persons to whom the Software is furnished to do so, 
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

pkgname=nullpomino-git
pkgver=v7.5.0.r126.gfd8d758
pkgver() {
  cd "nullpomino"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
arch=(any)
pkgdesc="An action puzzle game"

url="https://github.com/nullpomino/nullpomino"
license=("BSD")

depends=(
    "jre8-openjdk"
)
makedepends=(
    "maven" "jdk8-openjdk"
)

source=("git+https://github.com/nullpomino/nullpomino.git")
md5sums=("SKIP")

build() {
    cd "nullpomino"
    {
        cd nullpomino-parent
        mvn clean package -Dmaven.test.skip=true
    }
}

package() {
    cd "nullpomino"
    {
        cd nullpomino-run/target
        mkdir -p "$pkgdir/opt/nullpomino"
        cp -r install/* "$pkgdir/opt/nullpomino"
    }
}
