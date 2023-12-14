# Maintainer: éclairevoyant

pkgname=bitwarden-cli-bin
pkgver=2023.12.0
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
sha256sums=('2ac59071fbc7a39090b05a986bf9179c55f480b21564aa02aa83ad76303282fa'
            '7c5d03f9f47304f52eee7b689fba9854c44a07e0e0e35fccdecced9dbb6cd82f')

prepare() {
	sed -i "s/$/ bw-linux-$pkgver.zip/" bw-linux-sha256-$pkgver.txt
	sha256sum -c bw-linux-sha256-$pkgver.txt
}

package() {
	install -Dm755 bw -t "$pkgdir/usr/bin/"
}
