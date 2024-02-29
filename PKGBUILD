# Maintainer: éclairevoyant

pkgname=bitwarden-cli-bin
pkgver=2024.2.0
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
sha256sums=('836e7cccac3711df0d81644a73fa9c6fc97d7681c9b11eff7db2d20d9190f787'
            'be9180d859f44daf49cfeea52dbe6e6a122aa17ab3b4a22d4f4fd14f819fa829')

prepare() {
	sed -i "s/$/ bw-linux-$pkgver.zip/" bw-linux-sha256-$pkgver.txt
	sha256sum -c bw-linux-sha256-$pkgver.txt
}

package() {
	install -Dm755 bw -t "$pkgdir/usr/bin/"
}
