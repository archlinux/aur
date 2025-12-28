pkgname=amber-lang-git
_pkgname=amber
pkgver=r681.ef8ad43
pkgrel=1
pkgdesc="The programming language compiled to bash"
url="https://amber-lang.com/"
depends=('bash' 'bc')
makedepends=('cargo' 'rust')
arch=('any')
license=('GPL-3.0')
provides=('amber-lang')
conflicts=('amber-bash-bin' 'amber-bash-git' 'amber-lang-bin')

source=("git+https://github.com/amber-lang/amber")
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo b -r
}

package() {
  cd "$srcdir/${_pkgname}/target/release"
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
