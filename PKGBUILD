# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

_pkgname=hadolint
pkgname=hadolint-git
pkgver=r891.f0ef28b
pkgrel=1
pkgdesc='Dockerfile linter, validate inline bash, written in Haskell'
url='Dockerfile linter, validate inline bash, written in Haskell'
license=('GPL')
source=('git+https://github.com/hadolint/hadolint.git')
sha256sums=('SKIP')
arch=('any')
makedepends=('git' 'stack' 'libgmp-static')
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

