# Maintainer: n0va <n0va@krzak.org>
pkgname=kewt-bin
pkgver=1.6.7
pkgrel=1
pkgdesc="A minimalist, 100% POSIX, static site generator inspired by werc and kew"
arch=('any')
url="https://kewt.krzak.org"
license=('ISC')
depends=('sh')
provides=('kewt')
conflicts=('kewt' 'kewt-git')
source=("${pkgname}-${pkgver}.sh::https://git.krzak.org/N0VA/kewt/releases/download/v${pkgver}/kewt"
        "${pkgname}-${pkgver}.bash::https://git.krzak.org/N0VA/kewt/releases/download/v${pkgver}/kewt.bash")
sha256sums=('92326e979aa3d58441842b43f9fa9a98abda0f06fe08a8331ef16b9516cdddc7' 'SKIP')

build() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.sh"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/kewt"
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  "${pkgdir}/usr/bin/kewt" --dump-zsh-completions > "${pkgdir}/usr/share/zsh/site-functions/_kewt"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}.bash" "${pkgdir}/usr/share/bash-completion/completions/kewt"
}
