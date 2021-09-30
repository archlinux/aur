# Maintainer: Jan Waś <janek.jan at gmail com>

pkgname=jp
pkgver=0.2.0
pkgrel=1
pkgdesc='Command line interface to JMESPath'
arch=('x86_64')
url='http://jmespath.org'
license=('Apache')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=('jp::git+https://github.com/jmespath/jp#tag=0.2.0')
sha512sums=('SKIP')

build() {
  tempgopath="$(pwd)/go"
  jppath="${tempgopath}/src/github.com/jmespath"
  fakerepo="$jppath/jp"
  mkdir -p $jppath
  ln -s "$(pwd)/${pkgname}" "$jppath/jp"
  export GOPATH="$tempgopath"
  cd "$fakerepo"
  go build
}

package() {
  cd "${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
