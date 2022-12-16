pkgname="serial-cli-git"
_pkgname="serial-cli"
pkgver=r12.7fb4785
pkgrel=1
pkgdesc="serial app"
arch=('x86_64' 'x86')
url="https://github.com/ToniLipponen/Serial-cli.git"
license=('MIT')
makedepends=(
	'git'
	'gcc'
)
source=("${_pkgname}::git+https://github.com/ToniLipponen/Serial-cli.git")
sha512sums=("SKIP")
provides=(serial-cli)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	make build
}

package() {
	cd "${srcdir}/${_pkgname}"
	make install DESTDIR="$pkgdir" PREFIX="/usr"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
