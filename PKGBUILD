# Maintainer: karlthegamer101 <karllauri11@gmail.com>
pkgname=anonlauncher
pkgver=1.0.0
pkgrel=1
pkgdesc="Matrix-themed Minecraft launcher - no account needed, supports Fabric/Forge/Quilt"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/karllauri2-dot/ANONLauncher"
license=('MIT')
depends=('python' 'python-requests' 'python-minecraft-launcher-lib' 'python-pillow' 'python-pypresence' 'java-environment')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('java-runtime: run Minecraft'
            'xorg-xrandr: display settings')
source=("$pkgname-$pkgver.tar.gz::https://github.com/karllauri2-dot/ANONLauncher/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/ANONLauncher-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/ANONLauncher-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "linux/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "linux/io.github.karllauri2dot.anonlauncher.appdata.xml" "$pkgdir/usr/share/metainfo/io.github.karllauri2dot.anonlauncher.appdata.xml"
    install -Dm644 "anonlauncher/assets/icon_512.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
