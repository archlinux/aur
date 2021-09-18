# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=aura-bin
pkgver=3.2.6
pkgrel=1
pkgdesc="A secure package manager for Arch Linux and the AUR - Prebuilt binary"
url="https://github.com/fosskers/aura"
license=('GPL3')
arch=('x86_64')
depends=('gmp' 'pacman' 'git')
optdepends=('bash-completion: for bash completions')
provides=('aura')
conflicts=('aura' 'aura-git')
options=('strip')
backup=("etc/aura.conf")
source=("aura-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/aura-$pkgver-x86_64.tar.gz")
sha256sums=('8b6de8b56b8f33672ed207ebd70d11b204bfb4dc53cf09c7432ee016b9bef73c')

package() {
    # Install aura binary
    install -Dm755 aura -t "$pkgdir/usr/bin/"

    # Installing conf file
    install -Dm644 aura.conf -t "$pkgdir/etc"

    # Installing man pages
    install -Dm644 aura.8 -t "$pkgdir/usr/share/man/man8"
    install -Dm644 aura.conf.5 -t "$pkgdir/usr/share/man/man5"

    # Installing bash completions
    install -Dm644 bashcompletion.sh \
      "$pkgdir/usr/share/bash-completion/completions/aura"

    # Installing zsh completions
    install -Dm644 _aura -t \
      "$pkgdir/usr/share/zsh/site-functions"

    # Directories for storing PKGBUILDs, source packages & installed package states
    install -d "$pkgdir/var/cache/aura/"{pkgbuilds,src,states}
}
