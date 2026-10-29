# Maintainer: Morgan <morganamilo@archlinux.org>
pkgname=paru-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='Feature packed AUR helper'
url='https://github.com/morganamilo/paru'
source_x86_64=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-x86_64.tar.zst")
source_aarch64=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-aarch64.tar.zst")
source_armv7h=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-armv7h.tar.zst")
backup=("etc/paru.conf")
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later')
depends=('git' 'pacman>=7.1' 'libalpm.so')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
conflicts=('paru')
provides=('paru')
sha256sums_x86_64=('52fc01ebd5ad120c19e0f879b0c262f3c81c58f956dba2f0d700457e1aa846cf')
sha256sums_aarch64=('26d34fd815a8bb7d0ffe60247c7eb36c36d927d592382eb44b9ec2649e2543d8')
sha256sums_armv7h=('1d1cd50af324b3d1de65a4e23b13c6cea5ce7f858c34841a4b457be992dee78d')

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
