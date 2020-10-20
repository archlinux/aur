# Maintainer: Oleksii Opaliev <rayder.ua@gmail.com>
# Contributor: Oleksii Opaliev <rayder.ua@gmail.com>
_appname_=werf
pkgname=${_appname_}-git
pkgver=v1.2.0.alpha11.r0.g4bfce41cd
pkgrel=1
pkgdesc="Open Source CLI tool written in Go, designed to simplify and speed up the delivery of applications"
arch=('x86_64')
license=('Apache')
url="https://github.com/werf/werf"
provides=("${_appname_}-bin" "${_appname_}")
conflicts=("${_appname_}-bin" "${_appname_}")
makedepends=('git' 'curl')
source=("git+https://github.com/werf/werf.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/werf"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/werf"
  TAG=$(git describe)
  curl -Ls https://dl.bintray.com/flant/werf/${TAG}/werf-linux-amd64-${TAG} -o werf
}

check() {
  cd "${srcdir}/werf"
  test -f werf || true
}

package() {
  install -Dm644 "${srcdir}/werf/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "${srcdir}/werf/werf" "${pkgdir}/usr/bin/werf"
}
