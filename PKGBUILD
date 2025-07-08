# Maintainer: Morgan <morganamilo@archlinux.org>
pkgname=paru-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='Feature packed AUR helper'
url='https://github.com/morganamilo/paru'
source_x86_64=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-x86_64.tar.zst")
source_aarch64=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-aarch64.tar.zst")
source_armv7h=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-armv7h.tar.zst")
backup=("etc/paru.conf")
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later')
depends=('git' 'pacman' 'libalpm.so>=14')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
conflicts=('paru')
provides=('paru')
sha256sums_x86_64=('28ef88736080e7e96e569f7adf10517ef8310a68b528e7f34c795287d7271880')
sha256sums_aarch64=('7d3c7c029f5df300bdddf452f5af9fb194598253f4b1783dffa2c4668d65c3db')
sha256sums_armv7h=('1423a07a626cb5aeb39a72a503a77dd9e5321a776bafd8d813bdeaa290d2b43e')

package() {
  cd "$srcdir/"

  install -Dm755 paru "${pkgdir}/usr/bin/paru"
  install -Dm644 paru.conf "${pkgdir}/etc/paru.conf"

  install -Dm644 man/paru.8 "$pkgdir/usr/share/man/man8/paru.8"
  install -Dm644 man/paru.conf.5 "$pkgdir/usr/share/man/man5/paru.conf.5"

  install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/paru.bash"
  install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/paru.fish"
  install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_paru"

  cp -r locale "$pkgdir/usr/share/"
}
