# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
pkgver=0.107.78
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
sha256sums_armv7h=('948120085d25e7f95294e7ec38adc31cf2748e1c41003fb9b17d02f6082fb808')
sha256sums_aarch64=('71ef6d495d6d3fae45e6a80a172d44ae7f5aa528794cf927bb52fd5bff034eae')
sha256sums_pentium4=('a49d39195cebbee61de48804119ad3337ec8095783f9afd8447d13da9797fa4c')
sha256sums_powerpc64le=('b8039e22135aa056f31994d95d5adc20179615a7c22d3785578c25754c045498')
sha256sums_riscv64=('c779ac49c13eeaacd3ce00e97ebc731999ee5cfc2eb55e516a9745aed37dc035')
sha256sums_x86_64=('2070f644644be8299232f4a7bff857036fb1423563c1bf8c787e07aaf4f88278')

package() {
    install -Dm755 AdGuardHome/AdGuardHome "$pkgdir/usr/bin/$_name"
    install -Dm644 AdGuardHome/CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 $_name.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 $_name.sysusers "$pkgdir/usr/lib/sysusers.d/$_name.conf"
    install -d "$pkgdir/etc"
    ln -s /var/lib/$_name/AdGuardHome.yaml "$pkgdir/etc/$_name.yaml"
}
