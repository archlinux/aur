# Maintainer: SanskritFritz (gmail)
# Contributor: Frank Seifferth <frankseifferth@posteo.net>

pkgname=tmux-xpanes
pkgver=4.2.0
pkgrel=1
pkgdesc='Create multiple panes with ultimate terminal divider.'
arch=('any')
url='https://github.com/greymd/tmux-xpanes'
depends=('tmux')
license=('MIT')
source=("https://github.com/greymd/tmux-xpanes/archive/v$pkgver.tar.gz")
md5sums=('2ec21aa51797e3ebb1978617588e952f')

build() {
    cd "$srcdir/tmux-xpanes-$pkgver"
    test -f man/xpanes.1.gz || gzip man/xpanes.1
}

package() {
    install -D -m 755 "$srcdir/tmux-xpanes-$pkgver/bin/xpanes" "$pkgdir/usr/bin/xpanes"
    install -D -m 755 "$srcdir/tmux-xpanes-$pkgver/bin/tmux-xpanes" "$pkgdir/usr/bin/tmux-xpanes"
    install -D -m 644 "$srcdir/tmux-xpanes-$pkgver/man/xpanes.1.gz" "$pkgdir/usr/share/man/man1/xpanes.1.gz"
    ln -s "xpanes.1.gz" "$pkgdir/usr/share/man/man1/tmux-xpanes.1.gz"
    install -D -m 644 "$srcdir/tmux-xpanes-$pkgver/completion/zsh/_xpanes" "$pkgdir/usr/share/zsh/site-functions/_xpanes"
    ln -s "_xpanes" "$pkgdir/usr/share/zsh/site-functions/_tmux-xpanes"
}
