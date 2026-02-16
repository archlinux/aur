pkgname=arch-update-vai
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc="Script interativo para atualizar Arch Linux (pacman, AUR, Flatpak, Snap, fwupd) - git"
arch=('any')
url="https://github.com/CapivaraVai/arch-update-script-vai"
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

source=("git+https://github.com/CapivaraVai/arch-update-script-vai.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/arch-update-script-vai"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//; s/-/.r/; s/-/./' \
    || printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/arch-update-script-vai"

  install -Dm755 update-vai.sh "$pkgdir/usr/bin/update-vai"

  # docs (se existirem no repo)
  [[ -f README.md ]] && install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  [[ -f CHANGELOG.md ]] && install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
