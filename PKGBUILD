# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=pacolog
pkgver=3.1.0
pkgrel=1
pkgdesc='List recent commits for Arch Linux packages'
url='https://gitlab.com/protist/pacolog'
arch=('any')
license=('GPL-3.0-only')
depends=(
  'bash'
  'coreutils'
  'git'
  'pacman'
  'sed'
  'util-linux'
  'w3m'
)

source=("https://gitlab.com/protist/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('81aa33f1665470c2b4bdf031c2409a97180a9daf70f568cc27f58e844190a524')

package() {
  cd "$pkgname-v$pkgver"

  # Install program itself
  install -Dm755 ${pkgname} "$pkgdir/usr/bin/${pkgname}"

  # Install shell completions
  install -Dm644 completion/bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 completion/zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

  # Install man pages
  install -Dm644 -t "${pkgdir}/usr/share/man/man8/" doc/${pkgname}.8
  install -Dm644 -t "${pkgdir}/usr/share/man/man5/" doc/${pkgname}.conf.5

  # Install default system configuration
  install -Dm644 default-config.conf "${pkgdir}/etc/${pkgname}.conf"

  # Install README.md, CONFIGURATION.md, and example user configuration
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md CONFIGURATION.md example-config.conf
}
