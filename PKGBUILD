# Maintainer: Ray Shirohara <RShirohara@gmail.com>

pkgname=textimg
pkgver=3.1.8
pkgrel=1
pkgdesc='Command to convert from color text (ANSI or 256) to image.'
arch=('x86_64')
url='https://github.com/jiro4989/textimg'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('noto-fonts-cjk: Default font used in linux')
provides=('textimg')
options=('!strip')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('69f7d14e89f03eb845ec86d44b9f2b0c854c67cdf7ac5454f56050b5f28ab929')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -buildmode=pie --trimpath
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go test -cover ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 README_ja.md "${pkgdir}/usr/share/doc/${pkgname}/README_ja.md"
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/docs"
  install -Dm644 docs/* "${pkgdir}/usr/share/doc/${pkgname}/docs/"
  install -Dm644 completions/bash/textimg "${pkgdir}/usr/share/bash-completion/completions/textimg"
  install -Dm644 completions/zsh/_textimg "${pkgdir}/usr/share/zsh/site-functions/_textimg"
}
