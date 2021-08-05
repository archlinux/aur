# Maintainer: Morgan <morganamilo@archlinux.org>
pkgname=paru-bin
pkgver=1.8.0
pkgrel=1
pkgdesc='Feature packed AUR helper'
url='https://github.com/morganamilo/paru'
source=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/locale-v$pkgver.tar.zst")
source_x86_64=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-x86_64.tar.zst")
source_aarch64=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-aarch64.tar.zst")
backup=("etc/paru.conf")
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('git' 'pacman')
optdepends=('asp: downloading repo pkgbuilds' 'bat: colored pkgbuild printing' 'devtools: build in chroot')
conflicts=('paru')
provides=('paru')
sha256sums=('fa46cdb4b9061270265186e8a6735e861558cd8b650288aee7323394074205bc')
sha256sums_x86_64=('86dc9c8ee4e0f8f751fc0d38fdd20375bf611e40d94faa9455727aa397e0b163')
sha256sums_aarch64=('cf179a8199101252386ab9c5a85c80f8210bcece552318bbdbcf6efe45c5a7dc')

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
