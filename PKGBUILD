# Maintainer: Jguer <joaogg3 at gmail dot com>
pkgname=yay-bin
pkgver=10.3.0
pkgrel=1
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

sha256sums_x86_64=('641fa41e87da2625472aa9184a51304bfc95fa3123e2e61812e3e44999b6c375')
sha256sums_aarch64=('e9dbd6742c1816730a815c1315620514efbb9627ba4576376544ffcd584e718b')
sha256sums_armv6h=('257d17161068e0e80d642f2bb3b436b9bd4d5e73e73063edea45fa42f2cbb0f8')
sha256sums_armv7h=('5b8d4162cc4388952da0260e2c8e1e4ca51e5a17d501e2f99cf9b6da6799a054')

package() {
  _output="${srcdir}/${pkgname/-bin/}_${pkgver}_${CARCH}"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${_output}/yay.8" "${pkgdir}/usr/share/man/man8/yay.8"

  # Shell autocompletion script
  install -Dm644 "${_output}/bash" "${pkgdir}/usr/share/bash-completion/completions/yay"
  install -Dm644 "${_output}/zsh" "${pkgdir}/usr/share/zsh/site-functions/_yay"
  install -Dm644 "${_output}/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yay.fish"

  LANGS="pt pt_BR en es eu fr_FR ja pl_PL ru_RU zh_CN"
  for lang in ${LANGS}; do
    install -Dm644 "${_output}/${lang}.mo" "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/yay.mo"
  done
}
