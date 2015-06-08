# Maintainer: drakkan <nicola.murino@gmail.com>
# Contributor: drakkan <nicola.murino@gmail.com>

pkgname=wrk2-git
_pkgname=wrk2
pkgver=r76.49fef15
pkgrel=1
pkgdesc='a HTTP benchmarking tool based mostly on wrk'
arch=('i686' 'x86_64')
url="https://github.com/giltene/${_pkgname}"
license=('Apache')
depends=()
makedepends=('git')
source=("git+https://github.com/giltene/${_pkgname}.git")
sha1sums=('SKIP')
options=('!makeflags'
         '!buildflags')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"
  install -Dm755 wrk "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${_pkgname}/LICENSE
  install -Dm644 NOTICE "$pkgdir"/usr/share/licenses/${_pkgname}/NOTICE
  install -d -m755 "$pkgdir"/usr/share/doc/${_pkgname}/examples/
  install -Dm644 README.md "$pkgdir"/usr/share/doc/${_pkgname}/README.md
  install -Dm644 scripts/*.lua "$pkgdir"/usr/share/doc/${_pkgname}/examples/
}

# vim:set ts=2 sw=2 et:
