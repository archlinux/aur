# Maintainer: Jguer <joaogg3 at gmail dot com>
pkgname=yay-bin
pkgver=10.3.1
pkgrel=2
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go. Pre-compiled."
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/Jguer/yay"
license=('GPL3')
depends=(
  'git'
)
optdepends=(
  'sudo'
)
provides=('yay')
conflicts=('yay' 'libalpm.so<13')

source_x86_64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_x86_64.tar.gz")
source_aarch64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_aarch64.tar.gz")
source_armv6h=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_armv6h.tar.gz")
source_armv7h=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_armv7h.tar.gz")

sha256sums_x86_64=('89b36e428295fa337527627e2f54dcf0b1e4700f29880a323b6b22e638eb197c')
sha256sums_aarch64=('258b83370fcb1c37bf29ec8ce529d98ce8c258e351f6f5fd14c6c9c8e5223e57')
sha256sums_armv6h=('df2372eda123de3c83203ac94ad150256caf84f6536143f9c1f53d044022a1f0')
sha256sums_armv7h=('d0cdebffb6bb0bc3c71d629e500c4b40f2229973b42672b2198ac7ef34db97bc')

package() {
  _output="${srcdir}/${pkgname/-bin/}_${pkgver}_${CARCH}"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${_output}/yay.8" "${pkgdir}/usr/share/man/man8/yay.8"

  # Shell autocompletion script
  install -Dm644 "${_output}/bash" "${pkgdir}/usr/share/bash-completion/completions/yay"
  install -Dm644 "${_output}/zsh" "${pkgdir}/usr/share/zsh/site-functions/_yay"
  install -Dm644 "${_output}/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yay.fish"

  LANGS="pt pt_BR en es eu fr_FR ja pl_PL ru_RU zh_CN ko"
  for lang in ${LANGS}; do
    install -Dm644 "${_output}/${lang}.mo" "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/yay.mo"
  done
}
