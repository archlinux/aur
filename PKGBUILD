# Maintainer: Grant Handy <grantshandy AT gmail DOT com>

_pkgname='thes'
pkgname=${_pkgname}-git
pkgver=0.1.2.r0.g2c88e93
pkgrel=1
pkgdesc="A CLI tool that finds the location of IP addresses."
arch=('x86_64')
url="https://github.com/DefunctLizard/thes"
license=('APACHE-2.0')
depends=('glibc')
makedepends=('rust' 'git')
source=("${_pkgname}::git+https://github.com/DefunctLizard/thes.git")
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
