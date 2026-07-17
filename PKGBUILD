# Maintainer: Stefan Schad <stefan+aur [at] finaloutpost [dot] de>
# Contributor: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=pinokio-bin
pkgver=8.0.31
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
source_x86_64=("$url/releases/download/v${pkgver}/Pinokio_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/v${pkgver}/Pinokio_${pkgver}_arm64.deb")

sha256sums_x86_64=('00c5972450d14e1794eb2f6360ec4bbc4af04c3b3b7d975cbae2fe3a3bf3c58a')
sha256sums_aarch64=('9645e3bccf9406be0376ced9ee1659afb0f113da542eaecf8d102881d3e74853')

prepare() {
	if [[ "$CARCH" == "x86_64" ]]; then
        ar x Pinokio_${pkgver}_amd64.deb
    elif [[ "$CARCH" == "aarch64" ]]; then
        ar x Pinokio_${pkgver}_arm64.deb
    fi
	tar xf data.tar.xz
}

package() {
	install -D "$srcdir/usr/share/icons/hicolor/512x512/apps/pinokio.png" "$pkgdir/usr/share/icons/hicolor/0x0/apps/pinokio.png"
	install -D "$srcdir/usr/share/applications/pinokio.desktop" "$pkgdir/usr/share/applications/pinokio.desktop"
	install -D "$srcdir/usr/share/doc/pinokio/changelog.gz" "$pkgdir/usr/share/doc/pinokio/changelog.gz"
	install -d "$pkgdir/opt/Pinokio"
	cp -r "$srcdir/opt/Pinokio" "$pkgdir/opt"
}
