# Maintainer: Oleksii Opaliev <rayder.ua@gmail.com>
# Contributor: Oleksii Opaliev <rayder.ua@gmail.com>
_appname_=werf
pkgname=${_appname_}-git
pkgver=v1.2.0.alpha10
pkgrel=1
pkgdesc="Open Source CLI tool written in Go, designed to simplify and speed up the delivery of applications"
arch=('x86_64')
license=('BSD')
url="https://github.com/openstack/liberasurecode"
provides=("${_appname_}-bin" "${_appname_}")
conflicts=("${_appname_}-bin" "${_appname_}")
makedepends=('git')
source=("git+https://github.com/werf/werf.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/werf"
  # Use the tag of the last commit
  git describe
}

build() {
  curl -LsO https://dl.bintray.com/flant/werf/${pkgver}/werf-linux-amd64-${pkgver}
}

check() {
  cd "${srcdir}/werf"
  test -f werf-linux-amd64-${pkgver} || true
}

package() {
  cd "${srcdir}/werf"
	install -Dm755 "${srcdir}"/werf-linux-amd64-${pkgver} "${pkgdir}/usr/bin/werf"
}
