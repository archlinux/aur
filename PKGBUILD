# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
pkgname=python-arc4
pkgver=0.5.0
pkgrel=1
pkgdesc="A small and insanely fast ARCFOUR (RC4) cipher implementation for Python"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/manicmaniac/arc4"
license=("MIT")
depends=(
  'glibc'
  'python>=3.7'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("git+$url#tag=$pkgver")
b2sums=('733b54a0806dd6e1cf5e1b736568f6150c1cffda1cbb5edf51f1469dcdc9109beb2a04aca23c9ddfd4cbd64fe8013482341fc5b5cf6ac78f304323332aba6203')

prepare() {
  git -C arc4 clean -dfx
}

build() {
  cd arc4
  python -m build -wnx
}

check() {
  cd arc4
  python -m unittest
}

package() {
  cd arc4
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm0644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
