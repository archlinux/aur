# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=aura-bin
pkgver=3.1.0
pkgrel=2
pkgdesc="A secure package manager for Arch Linux and the AUR - Prebuilt binary"
url="https://github.com/fosskers/aura"
license=('GPL-3')
arch=('x86_64')
depends=('gmp' 'pacman' 'git')
optdepends=()
provides=('aura')
conflicts=('aura' 'aura-git')
options=('strip')
backup=("etc/aura.conf")
source=(https://github.com/fosskers/aura/releases/download/v${pkgver}/aura-${pkgver}-x86_64.tar.gz)
md5sums=('4f61d39cd6f0b1f11503ae1e6433a5e3')

package() {
    # Install aura binary
    mkdir -p "$pkgdir/usr/bin/"
    install -m 755 aura "$pkgdir/usr/bin/"

    # Installing conf file
    mkdir -p "$pkgdir/etc/"
    install -m 644 aura.conf "$pkgdir/etc/aura.conf"

    # Installing man pages
    mkdir -p "$pkgdir/usr/share/man/man8/"
    install -m 644 aura.8 "$pkgdir/usr/share/man/man8/aura.8"
    mkdir -p "$pkgdir/usr/share/man/man5/"
    install -m 644 aura.conf.5 "$pkgdir/usr/share/man/man5/aura.conf.5"

    # Installing bash completions
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
    install -m 644 bashcompletion.sh "$pkgdir/usr/share/bash-completion/completions/aura"

    # Installing zsh completions
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
    install -m 644 _aura "$pkgdir/usr/share/zsh/site-functions/_aura"

    # Directory for storing PKGBUILDs
    mkdir -p "$pkgdir/var/cache/aura/pkgbuilds"

    # Directory for storing source packages
    mkdir -p "$pkgdir/var/cache/aura/src"

    # Directory for storing installed package states
    mkdir -p "$pkgdir/var/cache/aura/states"
}
