# Maintainer: Vimsucks <dev@vimsucks.com>

pkgname=frp
pkgver=0.14.0
pkgrel=1
pkgdesc="A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet."
license=('Apache')
url="https://github.com/fatedier/frp"
source=(frps.service frpc.service frps@.service frpc@.service)
source_i686=("https://github.com/fatedier/frp/releases/download/v${pkgver}/frp_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://github.com/fatedier/frp/releases/download/v${pkgver}/frp_${pkgver}_linux_amd64.tar.gz")
sha256sums=('a83bf9e3bec4cc134391c49fccb32f517a2e90307c7217236513c7408f9b1b8f'
            '422d9e7c79257bfdcf19133e9f37d74bf0478d81f039bce18f63935505a18963'
            '34432236e6ef21108700c017604ebb0f6c20f463c02054060912ea061ca31d8d'
            'd7267378516cc782e08794bc3ec73fc719620b0c2c451224b366e4985335bccd')
sha256sums_i686=('8bf5236409081d862b6a0da265e8655bd02635411f6fc918ad29022e5d7926b4')
sha256sums_x86_64=('58613aa1474610ec53812bf7efa5f69dfcd3dc8d973bd666c5c828240805436a')
arch=('i686' 'x86_64')

install=$pkgname.install

package() {
    case $CARCH in
        x86_64)ARCH=amd64
               ;;
        i686)ARCH=386
             ;;
    esac

    frpdir=$srcdir/frp_${pkgver}_linux_${ARCH}
    mkdir -p $pkgdir/usr/bin
    install -m755  $frpdir/frpc $pkgdir/usr/bin/frpc
    install -m755  $frpdir/frps $pkgdir/usr/bin/frps

    mkdir -p $pkgdir/etc/frp
    install -Dm644 $frpdir/frpc.ini $pkgdir/etc/frp/frpc.ini
    install -Dm644 $frpdir/frpc_full.ini $pkgdir/etc/frp/frpc_full.ini
    install -Dm644 $frpdir/frps.ini $pkgdir/etc/frp/frps.ini
    install -Dm644 $frpdir/frps_full.ini $pkgdir/etc/frp/frps_full.ini

    install -Dm644 $frpdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    install -Dm644 frps.service  $pkgdir/usr/lib/systemd/system/frps.service
    install -Dm644 frpc.service  $pkgdir/usr/lib/systemd/system/frpc.service
    install -Dm644 frps@.service  $pkgdir/usr/lib/systemd/system/frps@.service
    install -Dm644 frpc@.service  $pkgdir/usr/lib/systemd/system/frpc@.service
}
