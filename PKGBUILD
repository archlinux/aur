# Maintainer: fordprefect
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
# Contributor: Brenton Horne

pkgname=hugo
pkgver=0.25
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
sha512sums=('104156569bbe520ba1033bfcae13b5fa04d4276b1061bb4f7c3f65bc06b64edf238a31d42dcfe0504fbddfd3ba0927b5b3e52d352baa6373a558123c2f4be1a7')

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
