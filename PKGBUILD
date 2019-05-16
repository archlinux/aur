# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>

pkgname=desk-git
pkgver=v0.6.0.r17.g252e683
pkgrel=1
pkgdesc="A lightweight workspace manager for the shell"
arch=('any')
url="https://github.com/jamesob/desk"
license=('MIT')
depends=('bash')
makedepends=('git')
source=("$pkgname::git+https://github.com/jamesob/desk")

sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname" || exit
    git describe --long --tags | \
      sed 's|^releases/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname/desk" "$pkgdir/usr/bin/desk"

    # completions
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -m644 "$srcdir/$pkgname/shell_plugins/bash/desk" "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    install -m644 "$srcdir/$pkgname/shell_plugins/zsh/_desk" "$pkgdir/usr/share/zsh/site-functions"
    install -dm755 "$pkgdir/usr/share/fish/completions"
    install -m644 "$srcdir/$pkgname/shell_plugins/fish/desk.fish" "$pkgdir/usr/share/fish/completions"

    # examples
    install -dm755 "$pkgdir/usr/share/desk/examples"
    install -m644 -t "$pkgdir/usr/share/desk/examples" "$srcdir/$pkgname/examples"/*

    install -m644 -t "$pkgdir/usr/share/desk" "$srcdir/$pkgname/README.md"
}

# vim:set ts=4 sts=4 sw=4 et:
