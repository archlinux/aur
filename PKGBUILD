# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.4.0b_9052
pkgrel=1
epoch=5
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://dvv.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt5-base' 'nss')
install=vrk-mpollux-digisign-client.install

source_x86_64=($pkgname-$pkgver.deb::"https://files.fineid.fi/download/digisign/${pkgver%_*}/linux/mpollux-digisign-client-for-dvv_$(tmp=${pkgver//_/-}; printf '%s' ${tmp//[a-z]/})_amd64.deb")

sha256sums_x86_64=('032077778089ffe2686001663c743b101248ec48d919d8d8954aefca5914115d')

backup=('etc/xdg/autostart/mpollux-digisign-client.desktop'
        'etc/xdg/Fujitsu/CCryptoLib.conf')

package() {
        tar xvfJ data.tar.xz -C "$pkgdir/"

        rmdir "$pkgdir/usr/sbin"
        mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
        install -D "$pkgdir/usr/share/doc/mpollux-digisign-client-for-dvv/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"
        mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-dvv" "$pkgdir/usr/share/doc/$pkgname"
}
