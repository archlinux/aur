# Maintainer: Pavlos Kafritsas <pkafritsas at proton dot me>

pkgname=code-remove-copilot-hook
pkgver=1.0
pkgrel=1
pkgdesc="Pacman hook to remove bundled Copilot from VS Code"
arch=(any)
url="https://aur.archlinux.org"
license=(GPL-3.0-or-later)
depends=('code')

package() {
  mkdir -p "$pkgdir/etc/pacman.d/hooks"
  cat > "$pkgdir/etc/pacman.d/hooks/${pkgname}.hook" <<'EOF'
[Trigger]
Operation = Install
Operation = Upgrade
Type = Package
Target = code
Target = visual-studio-code-bin
Target = visual-studio-code-insiders-bin

[Action]
Description = Removing bundled Copilot extension
When = PostTransaction
Exec = /bin/sh -c 'rm -rf /usr/share/code/resources/app/extensions/copilot /usr/share/code-insiders/resources/app/extensions/copilot'
EOF
}
