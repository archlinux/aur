# Maintainer: Colin Woodbury <colingw@gmail.com>
_hkgname=aura
pkgname=aura-bin
pkgver=1.3.0.5
pkgrel=1
pkgdesc="A secure package manager for Arch Linux and the AUR written in Haskell - Prebuilt binary"
url="https://github.com/fosskers/aura"
license=('GPL-3')
arch=('x86_64')
depends=('gmp' 'pacman' 'pcre' 'abs')
optdepends=('powerpill:    For faster repository downloads.'
            'customizepkg: For auto-editing of PKGBUILDs.'
            'aur-git:      AUR package completions for zsh.')
provides=('aura')
conflicts=('aura' 'aura-git')
options=('strip')
source=(https://bitbucket.org/fosskers/aura/downloads/${_hkgname}-${pkgver}-${CARCH}.tar.gz)

if [[ $CARCH = "x86_64" ]]; then
  md5sums=('e75fe610a5222e7b8b8a048313f4cce1')
else
  md5sums=()
fi

package() {
    # Install aura binary
    mkdir -p "$pkgdir/usr/bin/"
    install -m 755 aura "$pkgdir/usr/bin/"
  
    # Installing man page
    mkdir -p "$pkgdir/usr/share/man/man8/"
    install -m 644 aura.8 "$pkgdir/usr/share/man/man8/aura.8"

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
