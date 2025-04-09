# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=pinokio-bin
pkgver=3.8.0
pkgrel=1
pkgdesc='AI Browser.'
arch=('x86_64' 'aarch64')
url='https://github.com/pinokiocomputer/pinokio'
license=('MIT')
depends=('gtk3' 'libnotify' 'libnss_nis' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3')
makedepends=('binutils' 'tar')
provides=('pinokio')
conflicts=('pinokio')
source_x86_64=("$url/releases/download/$pkgver/Pinokio_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/$pkgver/Pinokio_${pkgver}_arm64.deb")

sha256sums_x86_64=('b83e1163921672cf9820e300ba40fd416a0eaeafcca04db167947ff89ec3d98d')
sha256sums_aarch64=('d16c905fa60d9f24eb2e8cfdefa7316569ff3cb6d6ad1078650ab1a228328e36')

prepare() {
	if [[ "$CARCH" == "x86_64" ]]; then
        ar x Pinokio_${pkgver}_amd64.deb
    elif [[ "$CARCH" == "aarch64" ]]; then
        ar x Pinokio_${pkgver}_arm64.deb
    fi
	tar xf data.tar.xz
}

package() {
	install -D "$srcdir/usr/share/icons/hicolor/0x0/apps/pinokio.png" "$pkgdir/usr/share/icons/hicolor/0x0/apps/pinokio.png"
	install -D "$srcdir/usr/share/applications/pinokio.desktop" "$pkgdir/usr/share/applications/pinokio.desktop"
	install -D "$srcdir/usr/share/doc/pinokio/changelog.gz" "$pkgdir/usr/share/doc/pinokio/changelog.gz"
	install -d "$pkgdir/opt/Pinokio"
	cp -r "$srcdir/opt/Pinokio" "$pkgdir/opt"
}
