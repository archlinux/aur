# Maintainer: yuzujr <15568103056@163.com>

pkgname=ani2xcursor
pkgver=1.5.0
pkgrel=1
pkgdesc="Convert Windows animated cursor themes to Linux Xcursor format"
arch=('x86_64' 'aarch64')
url="https://github.com/yuzujr/ani2xcursor"
license=('MIT')

depends=(
  'glibc'
  'gcc-libs'
  'spdlog'
  'fmt'
  'libxcursor'
  'libx11'
)
makedepends=(
  'xmake'
  'pkgconf'
  'gettext'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5426f8e775b10c2b4c7f8d4758377755fadeb91e31b15cad35ed9a2a434bc9a4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  xmake
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export XMAKE_ROOT=y
  xmake install -o "${pkgdir}/usr"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 completions/fish/ani2xcursor.fish \
    "${pkgdir}/usr/share/fish/vendor_completions.d/ani2xcursor.fish"

  install -Dm644 completions/bash/ani2xcursor \
    "${pkgdir}/usr/share/bash-completion/completions/ani2xcursor"

  install -Dm644 completions/zsh/_ani2xcursor \
    "${pkgdir}/usr/share/zsh/site-functions/_ani2xcursor"
}
