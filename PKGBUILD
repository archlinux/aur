#
# Maintainer: Diego Ernani (CapivaraVai) <dernani@gmail.com>
#
#
# Maintainer: Diego Ernani (CapivaraVai) <dernani@gmail.com>
#
pkgname=arch-update-vai
pkgver=0.7.1
pkgrel=1
pkgdesc="Script interativo para atualizar Arch Linux (pacman, AUR, Flatpak, Snap, fwupd)"
arch=('any')
url="https://codeberg.org/CapivaraVai/arch-update-vai"
license=('GPL-3.0-or-later')
depends=('bash')
makedepends=('git')
optdepends=(
  'yay: suporte a AUR'
  'flatpak: suporte a Flatpak'
  'snapd: suporte a Snap'
  'fwupd: suporte a firmware (fwupdmgr)'
  'reflector: atualizar mirrorlist automaticamente'
  'python: checar pacotes pip'
  'python-pip: checar pacotes pip'
)

source=("${pkgname}::git+https://codeberg.org/CapivaraVai/arch-update-vai.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname}"

  # programa principal
  install -Dm755 update-vai.sh "$pkgdir/usr/bin/update-vai"

  # licença
  [[ -f LICENSE ]] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # documentação opcional
  [[ -f README.md ]] && install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  [[ -f CHANGELOG.md ]] && install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
