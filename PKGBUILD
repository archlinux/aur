# Maintainer: Morgan <morganamilo@archlinux.org>
pkgname=paru-bin
pkgver=2.0.1
pkgrel=1
pkgdesc='Feature packed AUR helper'
url='https://github.com/morganamilo/paru'
source_x86_64=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-x86_64.tar.zst")
source_aarch64=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-aarch64.tar.zst")
source_armv7h=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-armv7h.tar.zst")
backup=("etc/paru.conf")
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL3')
depends=('git' 'pacman')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
conflicts=('paru')
provides=('paru')
sha256sums_x86_64=('5f573eaf97804da238c611f312670f7fe1895686f127ab2b993ea42733bb0a42')
sha256sums_aarch64=('86e4ca258a5cb83e252cf112171038145cfb940b21a55257a2a42196258dda83')
sha256sums_armv7h=('be1c638ead616f63d86bde0f8982ba4811727b3dec5f33b26492ec2b94a02f1c')

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
