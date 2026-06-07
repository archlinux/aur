# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Laurence Willetts <laurencewilletts at protonmail dot com>

pkgname=mpvc-git
pkgver=1.8.fish.r0.gd3dda65
pkgrel=1
pkgdesc='A mpc-like control interface for mpv.'
url='https://github.com/lwilletts/mpvc'
arch=(any)
license=(MIT)
depends=(mpv socat bc)
makedepends=(git)
provides=(mpvc)
conflicts=(mpvc)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    git -C mpvc describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd mpvc
    install -Dm755 mpvc extras/mpvc-{autopilot,chapter,cut,equalizer,fzf,mpris,tui,web} -t "$pkgdir/usr/bin/"
    install -Dm644 docs/man/man1/* -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 README.md docs/config/mpv.conf docs/logbook.html -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

