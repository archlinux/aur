# Maintainer: Jguer <pkgbuilds at jguer.space>
pkgname=yay-bin
pkgver=12.1.3
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

sha256sums_x86_64=('c4297663a4114f875365b1108ee019adc9c49cbf3ad801b2b8d9bdc382f4d035')
sha256sums_aarch64=('bbea24daabe8ccfad8e3427c3bd6bfe9a57b4c9bf15abf1aa61cad2fcd432660')
sha256sums_armv7h=('3bac34a408be48183476f42983e6a239e4e9401276615d1b787f5ae652e7236e')

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
