# Maintainer: Adam Perkowski <adas1per@protonmail.com>

pkgname=amdguid-glow-bin
pkgver=1.0.13
pkgrel=3
pkgdesc="AMDGPU temperature and fan speed monitoring tool"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=("https://github.com/Eraden/amdgpud/releases/download/v1.0.12/amdguid-glow-archlinux-latest-${pkgver}.zip")
arch=('x86_64')
md5sums=('75a62a7c5e083334a3b236c907ee600e')
keywords=('amdgpu' 'controller' 'fan' 'overclocking' 'voltage')
depends=('amdfand')
makedepends=('unzip')
optdepends=('amdmond' 'amdvold')
provides=('amdguid-glow' 'amdguid')

build() {
    cd $srcdir/
    unzip -o "amdguid-glow-archlinux-latest-${pkgver}.zip"
}

package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/bin/
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    install -m 0755 $srcdir/target/release/amdguid-glow $pkgdir/usr/bin
    install -m 0755 $srcdir/target/release/amdgui-helper $pkgdir/usr/bin
    install -m 0755 $srcdir/services/amdgui-helper.service "$pkgdir/usr/lib/systemd/system/amdgui-helper.service"
}
