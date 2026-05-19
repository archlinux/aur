# Maintainer: methamphetaminelab <https://github.com/methamphetaminelab>
pkgname=mpddiscordrpc
pkgver=0.1.0
pkgrel=3
pkgdesc="Display MPD currently playing track in Discord Rich Presence"
arch=("any")
url="https://github.com/methamphetaminelab/MPDDiscordRPC"
license=("MIT")
depends=("python" "python-pypresence" "python-mpd2" "python-requests")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel" "git")
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=("SKIP")

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "systemd/mpddiscordrpc.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
