# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=tf2cdownloader-git
_pkgname=tf2cdownloader
pkgver=r162.84ebd28
pkgrel=3
pkgdesc="Open Fortress's quick-n-easy downloading solution"
arch=("x86_64")
url="https://github.com/tf2classic/TF2CDownloader"
license=('GPL-3.0-only')
depends=("python-pyzstd" "python-rich" "python-tqdm" "python-httpx")
makedepends=("pyinstaller")
provides=("tf2cdownloader")
conflicts=("tf2cdownloader")
install=tf2cdownloader-git.install
source=("git+$url.git"
	"tf2cdownloader")
sha256sums=('SKIP'
            '5ff5bb94aec1072b453807bac84721a0ec2258ee7a69fed09e0b017aadc10b84')
pkgver() {
  cd "TF2CDownloader"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/TF2CDownloader"
	pyinstaller tf2c_downloader.spec
}

package() {
	cd "$srcdir/TF2CDownloader"
	install -Dm755 "$srcdir/TF2CDownloader/dist/tf2c_downloader" "$pkgdir/usr/share/tf2cdownloader/tf2cdownloader"
	install -Dm755 "$srcdir/tf2cdownloader" "$pkgdir/usr/bin/tf2cdownloader"
}
