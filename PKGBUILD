# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Marc Vidal <mvidaldp@gmail.com>

pkgname=adguardhome-bin
_name=${pkgname%-bin}
pkgver=0.107.72
pkgrel=2
pkgdesc='Network-wide ads and trackers blocking DNS server'
arch=(armv7h aarch64 pentium4 powerpc64le riscv64 x86_64)
url='https://github.com/AdguardTeam/AdGuardHome'
license=(GPL-3.0-only)
provides=($_name)
conflicts=($_name)
options=(!debug)
source=($_name.service $_name.sysusers)
source_armv7h=("AdGuardHome-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_armv7.tar.gz")
source_aarch64=("AdGuardHome-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_arm64.tar.gz")
source_pentium4=("AdGuardHome-$pkgver-pentium4.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_386.tar.gz")
source_powerpc64le=("AdGuardHome-$pkgver-powerpc64le.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_ppc64le.tar.gz")
source_riscv64=("AdGuardHome-$pkgver-riscv64.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_riscv64.tar.gz")
source_x86_64=("AdGuardHome-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/AdGuardHome_linux_amd64.tar.gz")
sha256sums=('b3763af1dae4d32645f3489cde5f07c919c7de9c76495a87268410347c67b873'
            'cdbb882eb167461418ea7ea5cca65d32fd018a231ac1a8bb7f3e7140345c8cf1')
sha256sums_armv7h=('13704b5088f5c492e8a6e161636c8d3e2722c2eebc0c4306ffca1be9bfa25d55')
sha256sums_aarch64=('5332366407f825b5929b492db953aab9ede99f9e75d6ecee1b9ea296d95a523e')
sha256sums_pentium4=('f31965131fa586ac5903fa0d6da86b0533f9035d70f31996052726ff3366a473')
sha256sums_powerpc64le=('ab7df0867cd331fe6059694612fbb0e37335ec2c4994a1e9d7b133bd85751359')
sha256sums_riscv64=('4dfc47c2539100b364e0a709ceea527b2c30ea9289dbc9ffb7f2b653b524a256')
sha256sums_x86_64=('cf25794597a2f5b6cd8cd3670439db6f548c59af4ace392e40055b90e80c9329')
validpgpkeys=('28645AC9776EC4C00BCE2AFC0FE641E7235E2EC6')  # AdGuard <devteam@adguard.com>

verify() {
    cd AdGuardHome
    gpg --verify AdGuardHome.sig AdGuardHome
}

package() {
    install -Dm755 AdGuardHome/AdGuardHome "$pkgdir/usr/bin/$_name"
    install -Dm644 AdGuardHome/CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 $_name.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 $_name.sysusers "$pkgdir/usr/lib/sysusers.d/$_name.conf"
    install -d "$pkgdir/etc"
    ln -s /var/lib/$_name/AdGuardHome.yaml "$pkgdir/etc/$_name.yaml"
}
