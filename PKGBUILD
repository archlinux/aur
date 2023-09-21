# Maintainer: éclairevoyant

pkgname=bitwarden-cli-bin
pkgver=2023.9.0
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
sha256sums=('f21aeda337d55859ed07f5dea7880ea9b42912b52ba47918f19a063ad8b9f939'
            '558b7e6907d04a781e746dbe6a8a1cf3e0bba26db4071e570bfa0f0f0a66d190')

prepare() {
	sed -i "s/$/ bw-linux-$pkgver.zip/" bw-linux-sha256-$pkgver.txt
	sha256sum -c bw-linux-sha256-$pkgver.txt
}

package() {
	install -Dm755 bw -t "$pkgdir/usr/bin/"
}
