# Maintainer: Jguer <joaogg3 at gmail dot com>
pkgname=yay-bin
pkgver=10.1.1
pkgrel=1
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go. Pre-compiled."
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/Jguer/yay"
license=('GPL')
depends=(
  'sudo'
  'git'
)
provides=('yay')
conflicts=('yay')

source_x86_64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_x86_64.tar.gz")
source_aarch64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_aarch64.tar.gz")
source_armv6h=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_armv6h.tar.gz")
source_armv7h=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_armv7h.tar.gz")

sha256sums_x86_64=('d93d0b12aa545e1ed6950b33706058d7894dd32a1031b7c6971c1ad1a931a7de')
sha256sums_aarch64=('cbee1f005b725f1a054441487cb5a297189d0cb94d1751808b5bb380cf897d80')
sha256sums_armv6h=('988d205d5c1d984f4f07639da3bad1e1117044794ddf2f91e3a47900a3cfddb3')
sha256sums_armv7h=('9d9f5cb95a7e9de2b8dcf8a777a7f6225ff6f0926cc3830d52a9bf69f9ccbbe5')

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
