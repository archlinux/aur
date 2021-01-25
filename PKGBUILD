# Maintainer: Grant Handy <grantshandy AT gmail DOT com>

_pkgname='ipgeo'
pkgname=${_pkgname}-git
pkgver=0.1.0.r3.g6c7e9c7
pkgrel=1
pkgdesc="A CLI tool that finds the location of IP addresses."
arch=('x86_64')
url="https://github.com/DefunctLizard/ipgeocli"
license=('GPL')
depends=('glibc')
makedepends=('rust' 'git')
source=("${_pkgname}::git+https://github.com/DefunctLizard/ipgeocli.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"
  cargo build --release
}

package() {
  cd "$srcdir/${_pkgname}"

  # Binary
  install -Dm755 target/release/$_pkgname $pkgdir/usr/bin/$_pkgname
}
