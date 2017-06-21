# Maintainer: fordprefect
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
# Contributor: Brenton Horne

pkgname=hugo
pkgver=0.24
pkgrel=1
pkgdesc="Fast and Flexible Static Site Generator in Go — built from source."
arch=('i686' 'x86_64')
url="https://gohugo.io/"
conflicts=("${pkgname}-src" "${pkgname}-bin")
license=('Apache')
depends=('glibc')
optdepends=('pygmentize: syntax-highlight code snippets.')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gohugoio/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('cc8bfd976e424bc180ff1387f00e1dd79141aa79b14caaefea93358a2ebfed520326bb849be95faf9dd9d7f15f5dec5d3cce184235ca20dbe413ac72271ca0a7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  export PATH="${PATH}:${srcdir}/bin"
  mkdir -p "${GOPATH}/src/github.com/gohugoio"
  ln -sf "$(pwd)" "${GOPATH}/src/github.com/gohugoio/hugo"
  cd "${GOPATH}/src/github.com/gohugoio/hugo"
  make hugo-no-gitinfo
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
