# Maintainer: éclairevoyant

pkgname=bitwarden-cli-bin
pkgver=2023.9.1
pkgrel=1
pkgdesc='Bitwarden Command-line Interface'
arch=(x86_64)
url='https://github.com/bitwarden/clients'
license=(GPL3)
depends=(gcc-libs glibc)
provides=(bitwarden-cli)
conflicts=(bitwarden-cli)
options=('!strip')
source=("$url/releases/download/cli-v$pkgver/"bw-linux-{$pkgver.zip,sha256-$pkgver.txt})
sha256sums=('3c035e1749f9acf2d29ac5e4c12acca1bd16416d150fe190109cb69345222c75'
            'bf2d29b9faeda2b448c8b01e07f9b01c1950b9e09350195ec8badfe3d332211c')

prepare() {
	sed -i "s/$/ bw-linux-$pkgver.zip/" bw-linux-sha256-$pkgver.txt
	sha256sum -c bw-linux-sha256-$pkgver.txt
}

package() {
	install -Dm755 bw -t "$pkgdir/usr/bin/"
}
