# Maintainer: Jguer <joaogg3 at gmail dot com>
pkgname=yay-bin
pkgver=10.2.2
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
conflicts=('yay' 'libalpm.so>12-64')

source_x86_64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_x86_64.tar.gz")
source_aarch64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_aarch64.tar.gz")
source_armv6h=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_armv6h.tar.gz")
source_armv7h=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_armv7h.tar.gz")

sha256sums_x86_64=('9f9a768903892ecd19382f626e5f2cf3c07019e2ce3f30634a3c34f585b87b70')
sha256sums_aarch64=('c5d9f2f3b0dfb7758825a9bdb67e242e0f51443663aec5e4218785a731e6c31b')
sha256sums_armv6h=('9edf05f1f881a3463067c6a521a2dbbcd57a555f2f71c7b44f575feec4b4e07d')
sha256sums_armv7h=('fbd9019fe48c1abd8bafc0c01c24ebfba68037413abf30b4c129c45be70df5a7')

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
