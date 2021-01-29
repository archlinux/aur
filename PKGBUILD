# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
pkgname=python-johnnycanencrypt-git
_pkgbase=johnnycanencrypt
pkgver=r241.1e6f386
pkgrel=1
epoch=
pkgdesc="Python module for OpenPGP written in Rust"
arch=('any')
url="https://github.com/kushaldas/johnnycanencrypt"
license=('GPL')
depends=(mypy
         python-httpx)
makedepends=(git
             maturin
             python-pip)
provides=(python-johnnycanencrypt)
source=("git+https://github.com/kushaldas/$_pkgbase")
sha256sums=('SKIP')
pkgver() {
          cd "$_pkgbase"
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$_pkgbase"
	maturin build --release --no-sdist --manylinux off
}
package() {
	cd "$_pkgbase/target/wheels"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --compile *.whl
}
