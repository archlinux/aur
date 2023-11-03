# Maintainer: éclairevoyant

pkgname=bitwarden-cli-bin
pkgver=2023.10.0
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
sha256sums=('25b3376c7b215b9850844a14a15daa8b88817445acd0af12f5f2942606ef108a'
            'b1a538f9fea447bb21a35444fd61b403ea4da60b336b567f3c3e1a776923359f')

prepare() {
	sed -i "s/$/ bw-linux-$pkgver.zip/" bw-linux-sha256-$pkgver.txt
	sha256sum -c bw-linux-sha256-$pkgver.txt
}

package() {
	install -Dm755 bw -t "$pkgdir/usr/bin/"
}
