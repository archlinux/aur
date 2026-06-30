# Maintainer: Marcus Bandit <marcusbanditten@gmail.com>
pkgname=anirss
pkgver=0.3.4
pkgrel=1
pkgdesc="Search nyaa.si and hand the result to qBittorrent"
arch=('any')
url="https://github.com/marcusbandit/anirss"
license=('GPL-3.0-or-later')
depends=('python' 'fzf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marcusbandit/anirss/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e20df6b165bc6a149400ad721ffbc6f4c7f674499d899d3376ab3a2406e12004')

package() {
    cd "$pkgname-$pkgver"
    # Layout: /usr/lib/anirss/{anirss,anirss_lib}, /usr/bin/anirss -> launcher.
    # The launcher resolves its own path via os.path.realpath so it finds
    # anirss_lib next to it regardless of which symlink invoked it.
    install -d "$pkgdir/usr/lib/anirss"
    install -m 755 anirss "$pkgdir/usr/lib/anirss/anirss"
    cp -R anirss_lib "$pkgdir/usr/lib/anirss/anirss_lib"
    find "$pkgdir/usr/lib/anirss/anirss_lib" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/lib/anirss/anirss_lib" -type f -exec chmod 644 {} +
    install -d "$pkgdir/usr/bin"
    ln -s /usr/lib/anirss/anirss "$pkgdir/usr/bin/anirss"
    install -Dm644 README.md            "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE              "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 completions/_anirss  "$pkgdir/usr/share/zsh/site-functions/_anirss"
    install -Dm644 completions/anirss.bash "$pkgdir/usr/share/bash-completion/completions/anirss"
}
