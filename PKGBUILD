# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

_pkgname=hadolint
pkgname=hadolint-git
pkgver=r257.85789f3
pkgrel=1
pkgdesc='Dockerfile linter written in Haskell'
url='http://hadolint.lukasmartinelli.ch/'
license=('GPL')
source=('git+https://github.com/lukasmartinelli/hadolint.git')
sha256sums=('SKIP')
arch=('any')
makedepends=('git' 'stack')
provides=('hadolint')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Build
  stack build hadolint

  # Install the program.
  install -Dm755 .stack-work/install/*/*/*/bin/hadolint "${pkgdir}/usr/bin/hadolint"
}

# vim: ft=sh ts=2 sw=2 et

