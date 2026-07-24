# Maintainer: ple <ple21108@gmail.com>
# Contributor: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.4.0d_9074
pkgrel=1
epoch=5
pkgdesc="Client program for Finnish chip ID cards"
arch=('x86_64')
url="https://dvv.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt5-base' 'nss')
install=vrk-mpollux-digisign-client.install

source_x86_64=($pkgname-$pkgver.deb::"https://files.fineid.fi/download/digisign/${pkgver%_*}/linux/mpollux-digisign-client-for-dvv_$(tmp=${pkgver//_/-}; printf '%s' ${tmp//[a-z]/})_amd64.deb")

sha256sums_x86_64=('3a8e14936ab30425427b8bf1c27c78d3f07dd3041dc1b62e2c0cf13d7cfdb11a')

backup=('etc/xdg/autostart/mpollux-digisign-client.desktop'
        'etc/xdg/Fujitsu/CCryptoLib.conf')

package() {
        tar xvfJ data.tar.xz -C "$pkgdir/"

        rmdir "$pkgdir/usr/sbin"
        mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
        install -D "$pkgdir/usr/share/doc/mpollux-digisign-client-for-dvv/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"
        mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-dvv" "$pkgdir/usr/share/doc/$pkgname"
}
