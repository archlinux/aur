# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>
pkgname=wireguard-ui-bin
_pkgname=wireguard-ui
pkgver=0.5.2
pkgrel=1
pkgdesc="A web user interface to manage your WireGuard setup."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ngoduykhanh/$_pkgname"
license=('MIT')
source=($_pkgname.service
        99-wg.conf
        wgiptables.sh
        wg-reload.path
        wg-reload.service)

source_i686=($url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-386.tar.gz)
source_x86_64=($url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.tar.gz)
source_armv7h=($url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm.tar.gz)
source_aarch64=($url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm64.tar.gz)

sha256sums=('c60cbe2d47c616a2f9984c6c57ef60e810c7e57ca5054a318b3da8770bf03b76'
            'cf5bdce2ce87b5054042a70d8630f40a0f991c64c42786824f660245b943d2be'
            'bc8b1cee00a541eab44dab5bd23afddb99d9c667a5d4d083d7bf9575b321052c'
            '4b63dee5d287bb16a8e1a588ba24ccaeb91a4e0d2993bfeb9a1fb423bf08432d'
            '44d74ce9057193a34e2c6afc4996188bc9b26594cdb691f96076d1986b615e4f')
sha256sums_i686=('60e2f0005f60b01e10feb65941fa2ad6e919cde1d8004eaacca713a4cea0ee7d')
sha256sums_x86_64=('f1f13fbc548cd28bf41e9517ccb2e3564f4d9f893d174bfa20f7a61d18e954c5')
sha256sums_armv7h=('b15c8ff43d09fa1d63aa63aa185a8a5b9f4ece02ebf67e9aa5152888d4a6be6b')
sha256sums_aarch64=('024eb6da74f450a0f2715cc233573b714fdba14dbf9fd229ed1479bbd4e83ea6')

depends=('wireguard-tools')
conflicts=($_pkgname)
provides=($_pkgname)
install=$_pkgname.install

package() {
        install -d $pkgdir/{opt/$_pkgname,usr/lib/systemd/system,etc/sysctl.d}
        install -Dm755 $_pkgname $pkgdir/opt/$_pkgname/$_pkgname
        install -Dm644 $srcdir/$_pkgname.service ${pkgdir}/usr/lib/systemd/system/$_pkgname.service
        install -Dm644 $srcdir/99-wg.conf ${pkgdir}/etc/sysctl.d/99-wg.conf
        install -Dm755 $srcdir/wgiptables.sh ${pkgdir}/opt/$_pkgname/wgiptables
        install -Dm644 $srcdir/wg-reload.path ${pkgdir}/usr/lib/systemd/system/wg-reload.path
        install -Dm644 $srcdir/wg-reload.service ${pkgdir}/usr/lib/systemd/system/wg-reload.service
}
