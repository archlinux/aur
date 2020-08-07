# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=ChronoSync
_pkgname=ndn-chronosync
pkgname=${_pkgname}
pkgver=0.5.3
pkgrel=1
# epoch=
pkgdesc="Synchronization library for distributed realtime applications for NDN"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost')
makedepends=('git' 'gcc' 'python' 'pkgconf' 'sqlite' 'openssl>=1.0.2')
checkdepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=(https://github.com/named-data/${_reponame}/archive/${pkgver}.tar.gz)
noextract=()
sha256sums=('2ac5ad83026f7ed13abfffd25197a1d999f2e5eef9e9dd39b519d68d817d3071')
validpgpkeys=()

prepare() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	./waf configure --prefix=/usr --with-tests
}

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"
	./waf build
}

check() {
  echo >&2 echo "Tests can be skipped using the --nocheck arugment in makepkg"
  cd "${srcdir}/${_reponame}-${pkgver}"
  ./build/unit-tests
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}
