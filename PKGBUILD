# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=git-appraise
pkgver=0.7
pkgrel=1
pkgdesc="Distributed code review system for Git repositories"
arch=('i686' 'x86_64')
url="https://github.com/google/git-appraise"
license=('Apache')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("${pkgname}=${pkgver}")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b57dd4ac4746486e253658b2c93422515fd8dc6fdca873b5450a6fb0f9487fb3')

# Go URLs
_github_gourl='github.com/google'

build() {
  cd "${pkgname}-${pkgver}"

  export GOPATH="${srcdir}"
  go get -v ${_github_gourl}/${pkgname}/${pkgname}
}

# No test cases for now
# check() {
  # cd "${pkgname}-${pkgver}"

  # export GOPATH="${srcdir}"
  # go test -v -x ${_github_gourl}/${pkgname}/${pkgname}
# }

package() {
  cd "${pkgsrc}"
  install -Dm 775 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${pkgname}-${pkgver}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
