# Maintainer: Javier Tia <javier dot tia at gmail dot com>

pkgname=git-appraise
pkgver=0.3
pkgrel=1
pkgdesc="Distributed code review system for Git repositories"
arch=('i686' 'x86_64')
url="https://github.com/google/git-appraise"
license=('Apache')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("${pkgname}=${pkgver}")
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7ddeb56d55681025666c1823eb8ad688aad07ab6ccff40630d8ab6edc038ea17')

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
