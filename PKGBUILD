# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-git
pkgver=r0.0000000
pkgrel=2
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://kewt.krzak.org"
license=('ISC')
makedepends=('git')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-bin')
source=("${pkgname}::git+https://git.krzak.org/N0VA/kewt.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  sh tools/build-standalone.sh
}

package() {
  cd "${pkgname}"
  install -Dm755 kewt "${pkgdir}/usr/bin/kewt"
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kewt" --dump-zsh-completions > "${pkgdir}/usr/share/zsh/site-functions/_kewt"
}
