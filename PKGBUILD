# Maintainer: Haruue Icymoon <i@haruue.moe>
# Contributor: 4679 <4679 at pm dot me>

pkgname=hysteria-bin
_pkgbase=hysteria
pkgver=1.0.4
pkgrel=1
pkgdesc='A feature-packed network utility optimized for networks of poor quality (Binary Release)'
arch=('x86_64')
url='https://github.com/HyNetwork/hysteria'
license=('MIT')
depends=('glibc')
provides=('hysteria')
conflicts=('hysteria')
source=("$_pkgbase-tun-$pkgver-linux-amd64::https://github.com/HyNetwork/$_pkgbase/releases/download/v$pkgver/hysteria-tun-linux-amd64"
        "$_pkgbase-mit-license::https://raw.githubusercontent.com/HyNetwork/hysteria/01c7d18/LICENSE.md"
        'hysteria@.service'
        'hysteria-server@.service'
        'sysusers.conf')
sha256sums=('ff1bd968a80aaf8d1ebce50e7b52c279a6ef302ea11480eb8a862f2dd447c20e'
            '2a0462751a1e97b807cef1d2e0830b134ec6f211bd8d291b2de4acce4ec1db35'
            '61ef8c91f417d83411d89295495e0c926ded7ed02302e7a0efa123d564e12f7e'
            '5a0fb1185e7bff6e05ec8ecb8a45b269fd4c7fa562ab107954ab87642a71f8d0'
            'abaab463035e67c1e1728e5378b8f4a50960bf80d5005e02b3b2c9468f06150d')

package() {
  install -Dm755 "$srcdir/$_pkgbase-tun-$pkgver-linux-amd64" "${pkgdir}/usr/bin/${_pkgbase}"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/hysteria.conf"
  install -Dm644 "$srcdir/hysteria@.service" "$pkgdir/usr/lib/systemd/system/hysteria@.service"
  install -Dm644 "$srcdir/hysteria-server@.service" "$pkgdir/usr/lib/systemd/system/hysteria-server@.service"
  install -Dm644 "$srcdir/$_pkgbase-mit-license" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  install -dm755 "$pkgdir/etc/hysteria"
}
