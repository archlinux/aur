# PKGBUILD

# Maintainer: Daniele Fucini <dfucini [at] gmail [dot] com>

pkgname=xidle-inhibit
pkgver=0.4.2
pkgrel=1
pkgdesc='Honor org.freedesktop.ScreenSaver inhibit requests by blocking xautolock or xss-lock'
arch=('any')
url="https://git.shouldnt.work/fuxino/$pkgname"
license=('GPL-3.0-or-later')
depends=('glib2'
         'libx11'
         'libxss'
         'python'
         'python-gobject')
optdepends=('xautolock: xautolock backend'
            'xss-lock: xss-lock backend')
makedepends=('git')
checkdepends=('dbus'
              'python-pytest')
source=("git+$url?signed#tag=$pkgver")
validpgpkeys=('7E12BC1FF3B6EDB2CD8053EB981A2B2A3BBF5514')
sha256sums=('e768123eee2cc9620c999d92c805794f8d45cb0f7ca3fdcfcf126ff83a13eaf6')

check()
{
    cd "$srcdir"/"$pkgname"
    pytest -p no:cacheprovider
}

package()
{
    cd "$srcdir"/"$pkgname"
    install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
    install -Dm755 xidle-dim "$pkgdir"/usr/bin/xidle-dim
    install -Dm644 "$pkgname".service "$pkgdir"/usr/lib/systemd/user/"$pkgname".service
    install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
}
