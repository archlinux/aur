# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=ndn-cpp
_pkgname=ndn-cpp
pkgname=${_pkgname}-git
pkgver=v0.17.r66.g6d789adb
pkgrel=2
# epoch=
pkgdesc="A new implementation of a Named Data Networking client library written in C++ and C. It is wire format compatible with the NDN-TLV encoding."
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost' 'sqlite' 'openssl>=1.0.2')
makedepends=('git' 'python')
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${srcdir}/${_reponame}"
  git describe --long | sed 's/^ndn.cxx.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_reponame}"
  ./configure --prefix=/usr
}

build() {
  cd "${srcdir}/${_reponame}"
  make
}

#check() {
#}

package() {
  cd "${srcdir}/${_reponame}"
  DESTDIR=${pkgdir} make install
}
