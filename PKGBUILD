# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
pkgver=1.0.0
pkgrel=1
pkgdesc='Network-wide ads and trackers blocking DNS server'
arch=(armv7h aarch64 pentium4 powerpc64le riscv64 x86_64)
url=https://github.com/AdguardTeam/AdGuardHome
license=(GPL-3.0-only)
provides=($_name)
conflicts=($_name)
options=(!debug)
source=($_name.service $_name.sysusers)
source_armv7h=(AdGuardHome-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_armv7.tar.gz)
source_aarch64=(AdGuardHome-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_arm64.tar.gz)
source_pentium4=(AdGuardHome-$pkgver-pentium4.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_386.tar.gz)
source_powerpc64le=(AdGuardHome-$pkgver-powerpc64le.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_ppc64le.tar.gz)
source_riscv64=(AdGuardHome-$pkgver-riscv64.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_riscv64.tar.gz)
source_x86_64=(AdGuardHome-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_amd64.tar.gz)
sha256sums=('b3763af1dae4d32645f3489cde5f07c919c7de9c76495a87268410347c67b873'
            'cdbb882eb167461418ea7ea5cca65d32fd018a231ac1a8bb7f3e7140345c8cf1')
sha256sums_armv7h=('7daac1e31ad5b244dd2bb87dca686f55a291156b2ea0477041acdf2cf3b23165')
sha256sums_aarch64=('f5c331d29580726179d3119c0464ddacd6fdcd487a0a9e108532f58fdf772604')
sha256sums_pentium4=('b7e8e43b90abe4f147817335cb5393347b4e11dc09decb1cb65e0230624473e8')
sha256sums_powerpc64le=('8ca8074f81f57a09d76ab7f785c23d6852800a502e4631cbda2923d88d02c1e5')
sha256sums_riscv64=('e5f1bc61ed2354d1784cf2e4f871ce4b1fc7964c344c8ec2773631c9b49eecf6')
sha256sums_x86_64=('19e023d98eb42eb1cdbfd6e4b6ebc937dade59e969506c62eafb3a3d6d2c1e4f')

package() {
    install -Dm755 AdGuardHome/AdGuardHome "$pkgdir/usr/bin/$_name"
    install -Dm644 AdGuardHome/CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 $_name.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 $_name.sysusers "$pkgdir/usr/lib/sysusers.d/$_name.conf"
    install -d "$pkgdir/etc"
    ln -s /var/lib/$_name/AdGuardHome.yaml "$pkgdir/etc/$_name.yaml"
}
