# Maintainer: SanskritFritz (gmail)
# Contributor: Frank Seifferth <frankseifferth@posteo.net>

pkgname=tmux-xpanes
pkgver=4.1.4
pkgrel=1
pkgdesc='Create multiple panes with ultimate terminal divider.'
arch=('any')
url='https://github.com/greymd/tmux-xpanes'
depends=('tmux')
license=('MIT')
source=("https://github.com/greymd/tmux-xpanes/archive/v$pkgver.tar.gz")
md5sums=('0584c7bbac67bd26a038d4627e45e936')

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
