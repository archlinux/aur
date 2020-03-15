# Maintainer: Jonathan Kotta <jpkotta@gmail.com>
pkgname=saved-kernel-modules
pkgver=0.0
pkgrel=1
pkgdesc="Save kernel modules of the running kernel"
arch=('i686' 'x86_64')
url=""
license=('GPL')
depends=("systemd")
install=saved-kernel-modules.install
changelog=
source=(pre-hook post-hook cleanup README
        saved-kernel-modules.service saved-kernel-modules.timer
        50-save-kernel-modules-pre.hook 90-save-kernel-modules-post.hook)
md5sums=('07048e088cebc1b8c272dadcab80923f'
         '947db382e3e874d19a5c05be18193552'
         'f71b096bfc811eb7a043e47e39a9a103'
         'f5741018c8b49127af92c78ab89a3412'
         'c1768f4613b5f21ac3d5b5966816b062'
         '5a06ebe9af9326003590773e2faaf9a4'
         '52bbea580c38948575d14d4391268f5d'
         '8560fb44654040c5bc7691fd60db6e54')

package() {
  cd "$srcdir"

  local main_dir="$pkgdir"/usr/lib/modules/saved-kernel-modules
  install -d -m 755 "$main_dir"
  install -m 644 pre-hook "$main_dir"/pre-hook
  install -m 644 post-hook "$main_dir"/post-hook
  install -m 644 cleanup "$main_dir"/cleanup
  install -m 644 README "$main_dir"/README

  local systemd_dir="$pkgdir"/usr/lib/systemd/system
  install -d -m 755 "$systemd_dir"
  install -m 644 saved-kernel-modules.service "$systemd_dir"/saved-kernel-modules.service
  install -m 644 saved-kernel-modules.timer "$systemd_dir"/saved-kernel-modules.timer

  local hook_dir="$pkgdir"/usr/share/libalpm/hooks
  install -d -m 755 "$hook_dir"
  install -m 644 50-save-kernel-modules-pre.hook "$hook_dir"/50-save-kernel-modules-pre.hook
  install -m 644 90-save-kernel-modules-post.hook "$hook_dir"/90-save-kernel-modules-post.hook
}

# vim:set ts=2 sw=2 et:
