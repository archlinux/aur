# Maintainer: Jguer <joaogg3 at gmail dot com>
pkgname=yay-bin
pkgver=10.2.3
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

sha256sums_x86_64=('aa3a6f2535fa16dd5d8d90fb59cba01e377b189fa56437699132622fd0a6539f')
sha256sums_aarch64=('1ccf3d52034863d15a31a4e327d295a1d489311eaf3975f14727f919e6c67f9b')
sha256sums_armv6h=('3da5c844da9896a63acb035c4d70663ebf07d0c15de547a569994d689575db00')
sha256sums_armv7h=('85ab9df2b813cefd38800475294943e48ec9341a24618553de8c03a4cb016110')

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
