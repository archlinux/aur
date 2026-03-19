# Maintainer: robertfoster

pkgname=voxtral.c-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Pure C inference engine for Mistral AI's Voxtral Realtime 4B speech-to-text model"
arch=('x86_64')
url="https://github.com/antirez/voxtral.c"
license=('MIT')
depends=('openblas')
makedepends=('git')
conflicts=("${pkgname%%-git}")
provides=("${pkgname%%-git}")
source=("${pkgname%%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%%-git}"

  make blas
}

package() {
  cd "${srcdir}/${pkgname%%-git}"

  install -Dm755 voxtral -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
