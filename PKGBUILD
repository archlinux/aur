# Maintainer: Pavel Korytov <thexcloud@gmail.com>

pkgname=eask-cli-bin
pkgver=0.12.10
pkgrel=1
pkgdesc='CLI for building, running, testing, and managing Emacs Lisp dependencies'
arch=('x86_64' 'aarch64')
url='https://github.com/emacs-eask/cli'
license=('GPL-3.0-or-later')
depends=('emacs>=26.1')
options=('!strip' '!debug')
provides=('eask-cli')
conflicts=('eask-cli' 'eask-cli-git')
source_x86_64=("${pkgname}-${pkgver}-linux.tar.gz::https://github.com/emacs-eask/cli/releases/download/${pkgver}/eask_${pkgver}_linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-linux.tar.gz::https://github.com/emacs-eask/cli/releases/download/${pkgver}/eask_${pkgver}_linux-arm64.tar.gz")
sha256sums_x86_64=('6d211b6f730bae0d6b86cb3c924dbed50b3ea1a7e3f3b49b0506dc6b9c1b48e1')
sha256sums_aarch64=('1e5637fd37668d8272e50b04882f1e1b92ac5830ce0f01b5fcb965b66069b0be')

package() {
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/eask"

  install -Dm755 "${srcdir}/eask" "${pkgdir}/usr/lib/eask/eask"
  cp -a "${srcdir}/lisp" "${pkgdir}/usr/lib/eask/"
  chmod -R u=rwX,go=rX "${pkgdir}/usr/lib/eask/lisp"

  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ln -sr "${pkgdir}/usr/lib/eask/eask" "${pkgdir}/usr/bin/eask"
}
