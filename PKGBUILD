# Maintainer: Snry Shell <snry@shell.dev>
pkgname=snry-shell-qs
pkgver=1.0.0
pkgrel=1
pkgdesc='Snry Shell - Hyprland dotfiles managed by Ansible'
arch=('any')
url='https://github.com/sonroyaalmerol/dots-hyprland'
license=('MIT')
depends=('ansible-core' 'git' 'rsync' 'python' 'uv' 'sudo' 'findutils' 'which')
makedepends=('git')
source=("git+https://github.com/sonroyaalmerol/dots-hyprland.git")
sha256sums=('SKIP')
backup=()
install=snry-shell-qs.install

package() {
  cd "$srcdir/dots-hyprland"
  install -dm755 "$pkgdir/usr/share/snry-shell"
  cp -a ansible.cfg inventory.ini requirements.yml setup.yml group_vars roles data files files-extra "$pkgdir/usr/share/snry-shell/"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/snry-shell" <<'SCRIPT'
#!/bin/bash
exec ansible-playbook /usr/share/snry-shell/setup.yml "$@"
SCRIPT
}