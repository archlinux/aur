# Maintainer: mfw <espadonne@outlook.com>

pkgname=gitswitcher
pkgver=1.9.0
pkgrel=1
pkgdesc='Secure Git identity and SSH/GPG key management tool for seamless account switching'
arch=('x86_64' 'aarch64')
url='https://github.com/tenseleyFlow/gitswitchC'
license=('GPL-3.0-or-later')
depends=('git' 'openssh' 'openssl')
makedepends=('gcc' 'make')
source=("git+https://github.com/tenseleyFlow/gitswitchC.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
    cd "$srcdir/gitswitchC"
    make BUILD_TYPE=release
}

package() {
    cd "$srcdir/gitswitchC"
    # PREFIX=/usr so the binary and shell completions land in Arch's real
    # paths (/usr/bin, /usr/share/{bash-completion,zsh/site-functions,fish})
    # rather than /usr/local, where zsh/fish completions wouldn't be found.
    make install DESTDIR="$pkgdir" PREFIX=/usr

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}