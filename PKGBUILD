# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname=git-appraise
pkgver=0.4
pkgrel=1
pkgdesc="Distributed code review system for Git repositories"
arch=('i686' 'x86_64')
url="https://github.com/google/git-appraise"
license=('Apache')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("${pkgname}=${pkgver}")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ae98f21bacca5e35a2571cbaae8217187f625804c4226d974da8451bf6fe5a98')

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
