# Maintainer: Algorant
# Prebuilt paru compatible with current libalpm — stopgap until upstream
# paru-bin is rebuilt. Source: https://github.com/Algorant/paru (fork of
# Morganamilo/paru at v2.1.0 + the maintainer-prescribed Cargo.lock bump,
# see https://github.com/Morganamilo/paru/issues/1454).
pkgname=paru-alpm-bin
pkgver=2.1.0.alpm16.1
pkgrel=1
pkgdesc='Prebuilt paru compatible with current libalpm - stopgap until upstream paru-bin is rebuilt'
url='https://github.com/Algorant/paru'
backup=("etc/paru.conf")
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('git' 'pacman' 'libalpm.so=16')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
provides=('paru')
conflicts=('paru' 'paru-bin' 'paru-git')
options=('!debug')
_tag=v2.1.0-alpm16.1
source_x86_64=("paru-$_tag-$CARCH.tar.zst::https://github.com/Algorant/paru/releases/download/$_tag/paru-$_tag-$CARCH.tar.zst")
sha256sums_x86_64=('1df9485b6212e79a6e2515f11fd9d90d0f6263085fa8887fcad78be600333f23')

package() {
  install -Dm755 paru "$pkgdir/usr/bin/paru"
  install -Dm644 paru.conf "$pkgdir/etc/paru.conf"

  install -Dm644 man/paru.8 "$pkgdir/usr/share/man/man8/paru.8"
  install -Dm644 man/paru.conf.5 "$pkgdir/usr/share/man/man5/paru.conf.5"

  install -Dm644 completions/bash "$pkgdir/usr/share/bash-completion/completions/paru.bash"
  install -Dm644 completions/fish "$pkgdir/usr/share/fish/vendor_completions.d/paru.fish"
  install -Dm644 completions/zsh "$pkgdir/usr/share/zsh/site-functions/_paru"

  install -d "$pkgdir/usr/share/"
  cp -r locale "$pkgdir/usr/share/"
}
