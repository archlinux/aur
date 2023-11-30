# Maintainer: Jguer <pkgbuilds at jguer.space>
pkgname=yay-bin
pkgver=12.2.0
pkgrel=1
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go. Pre-compiled."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Jguer/yay"
license=('GPL3')
depends=(
  'pacman>5'
  'git'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
provides=('yay')
conflicts=('yay')

source_x86_64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_x86_64.tar.gz")
source_aarch64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_aarch64.tar.gz")
source_armv7h=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_armv7h.tar.gz")

sha256sums_x86_64=('57a69ffe3259173acb2b28603301e23519b9770b0041d63fe716562b6b6be91e')
sha256sums_aarch64=('d7e064d9a64b30790a272d5e69eb811461ba9adf2f1ab354bd672ac4ae1eef4d')
sha256sums_armv7h=('7cda360dffed7d8f05e4b4666e881347ffc05ac18fefa7a1dcb3d13920270829')

package() {
  _output="${srcdir}/${pkgname/-bin/}_${pkgver}_${CARCH}"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${_output}/yay.8" "${pkgdir}/usr/share/man/man8/yay.8"

  # Shell autocompletion script
  install -Dm644 "${_output}/bash" "${pkgdir}/usr/share/bash-completion/completions/yay"
  install -Dm644 "${_output}/zsh" "${pkgdir}/usr/share/zsh/site-functions/_yay"
  install -Dm644 "${_output}/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yay.fish"

  LANGS="ca cs de en es eu fr_FR he id it_IT ja ko pl_PL pt_BR pt ru_RU ru sv tr uk zh_CN zh_TW"
  for lang in ${LANGS}; do
    install -Dm644 "${_output}/${lang}.mo" "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/yay.mo"
  done
}
