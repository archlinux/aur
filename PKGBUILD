# Maintainer: éclairevoyant

pkgname=bitwarden-cli-bin
pkgver=2024.1.0
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
sha256sums=('05c906bf3709151ffcd063624047c327086f80f6b0256ded6a8bcaea044fdb02'
            '47d7740c464b06abc6647da6cce03ebd195b564c489086bdcdd0c5dd76d330e3')

prepare() {
	sed -i "s/$/ bw-linux-$pkgver.zip/" bw-linux-sha256-$pkgver.txt
	sha256sum -c bw-linux-sha256-$pkgver.txt
}

package() {
	install -Dm755 bw -t "$pkgdir/usr/bin/"
}
