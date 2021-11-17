# Maintainer: Grigory Vasilyev <echo "h0tc0d3(-*A*-)g-m*a-i-l(-d#t-)c#m" | sed -e 's/-//ig;s/*//ig;s/(A)/@/i;s/#/o/ig;s/(dot)/./i'>

pkgname=verible
pkgver=0.0r1748.gd98e3b86
pkgrel=1
pkgdesc="SystemVerilog(Verilog) Parser, Style-Linter, and Formatter from Google"
arch=('x86_64')
url='https://github.com/chipsalliance/verible'
license=('Apache 2.0')
depends=('bash')
makedepends=('bazel' 'git')
provides=('verible')
conflicts=('verible-git')
_gittag="v0.0-1748-gd98e3b86"
source=("verible::git+https://github.com/chipsalliance/verible.git#tag=${_gittag}")
sha512sums=('SKIP')

pkgver() {

  cd "${srcdir:?}/${pkgname}" || (
    echo -e "\E[1;31mCan't cd to ${srcdir}/${pkgname} build directory! PkgVer Failed! \E[0m"
    exit 1
  )

  git describe --long --tags | cut -f1-3 -d- | cut -c2- | sed 's/-/r/;s/-/./'

}

build() {

  cd "${srcdir:?}/${pkgname}" || (
    echo -e "\E[1;31mCan't change working directory to ${srcdir}/${pkgname}! Build Failed!\E[0m"
    exit 1
  )

  bazel build -c opt //...

}

check() {

  cd "${srcdir:?}/${pkgname}" || (
    echo -e "\E[1;31mCan't change working directory to ${srcdir}/${pkgname}! Check Failed!\E[0m"
    exit 1
  )

  bazel test -c opt //...

}

package() {

  cd "${srcdir:?}/${pkgname}" || (
    echo -e "\E[1;31mCan't change working directory to ${srcdir}/${pkgname}! Package Failed!\E[0m"
    exit 1
  )

  bazel run -c opt :install -- "${pkgdir:?}/usr/bin"

}
