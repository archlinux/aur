# Maintainer: Victor Zhuk <zhuk at pm dot me>

pkgname=mon-1stplayer-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Linux hardware monitor daemon for the 1STPLAYER USB display'
arch=('x86_64')
url='https://github.com/victorzhuk/mon-1stplayer-linux'
license=('Apache-2.0')
depends=('glibc' 'systemd' 'nvidia-utils')
provides=("mon-1stplayer=$pkgver")
conflicts=('mon-1stplayer' 'mon-1stplayer-git')
backup=('etc/mon-1stplayer.conf')
source=("mon-1stplayer-bin-$pkgver.tar.gz::$url/releases/download/v$pkgver/mon-1stplayer-x86_64-linux.tar.gz")
sha256sums=('4462fd971e4d7fa8be09f27df66a8e756d3d73b25c4cd1291932686117617a5e')

package() {
    cd "mon-1stplayer-$pkgver-x86_64-linux"
    install -Dm755 'bin/mon-1stplayer' "$pkgdir/usr/bin/mon-1stplayer"
    install -Dm644 'deploy/mon-1stplayer.service' "$pkgdir/usr/lib/systemd/system/mon-1stplayer.service"
    install -Dm644 'deploy/mon-1stplayer.sysusers' "$pkgdir/usr/lib/sysusers.d/mon-1stplayer.conf"
    install -Dm644 'deploy/70-mon-1stplayer.rules' "$pkgdir/usr/lib/udev/rules.d/70-mon-1stplayer.rules"
    install -Dm644 'deploy/mon-1stplayer.conf' "$pkgdir/etc/mon-1stplayer.conf"
    install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
