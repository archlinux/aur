# Maintainer: éclairevoyant

pkgname=bitwarden-cli-bin
pkgver=2023.12.1
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
sha256sums=('ffea2c76c026a741ee6b7fe17e7385d4fe16e46edfd0cf685db2a50ca1d7b1e2'
            '76feefab49830c4a88b6668b191f0657c8dfc2d4c30c29a63265a633327d82c6')

prepare() {
	sed -i "s/$/ bw-linux-$pkgver.zip/" bw-linux-sha256-$pkgver.txt
	sha256sum -c bw-linux-sha256-$pkgver.txt
}

package() {
	install -Dm755 bw -t "$pkgdir/usr/bin/"
}
