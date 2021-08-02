# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
pkgname=sodalite
pkgver=0.21.2
pkgrel=1
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="https://www.github.com/hnicke/sodalite"
license=('GPL')
depends=(
    'python>=3.9'
    'python-binaryornot'
    'python-urwid'
    'python-yaml'
    'python-pyperclip'
    'python-pygments'
    'python-watchdog'
    'python-click'
    'python-blinker'
    'xdg-utils'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('a95e95938b27def8586b3cfccee855ef2e415f0f0175551e83e1da603af80cb0')

build() {
    cd $pkgname-$pkgver
    python setup.py build
}


package() {
    cd $pkgname-$pkgver
    python setup.py install \
    --root="$pkgdir" \
    --optimize=1 \
    --skip-build
    install -Dm644 sodalite.desktop "$pkgdir/usr/share/applications/sodalite.desktop"
    install -Dm644 docs/sodalite.1 "$pkgdir/usr/share/man/man1/sodalite.1"
    install -Dm644 docs/sodalite-open.1 "$pkgdir/usr/share/man/man1/sodalite-open.1"
    install -Dm644 docs/sodalite-open.1 "$pkgdir/usr/share/man/man1/sodalite-open.1"
    install -Dm755 scripts/sodalite-open "$pkgdir/usr/bin/sodalite-open"
    install -Dm644 README.md "$pkgdir/usr/share/doc/sodalite/README"
    install -Dm644 copyright "$pkgdir/usr/share/doc/sodalite/copyright"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/sodalite/changelog"
    install -Dm644 scripts/shell-integration.sh "$pkgdir/usr/share/sodalite/shell-integration.sh"
    install -Dm644 scripts/shell-integration.fish "$pkgdir/usr/share/sodalite/shell-integration.fish"
    install -Dm644 sodalite/core/sodalite.conf "$pkgdir/usr/share/sodalite/sodalite.conf"
} 
