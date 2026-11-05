# Maintainer: Marcus Bandit <marcusbanditten@gmail.com>
pkgname=anirss
pkgver=0.7.0
pkgrel=1
pkgdesc="Search the endpoints you add and hand releases to qBittorrent"
arch=('any')
url="https://github.com/marcusbandit/anirss"
license=('GPL-3.0-or-later')
depends=('python' 'fzf' 'python-setproctitle')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marcusbandit/anirss/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1fd2030a963bc6e5c1a6e5491fdbc3d78e11f6f17f1f056bb016b72d5fa8bd03')

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
