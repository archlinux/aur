# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=tg
pkgname=telegram-$_pkgname
pkgver=0.17.0
pkgrel=3
pkgdesc="terminal telegram client that really works"
arch=('any')
url="https://github.com/paul-nameless/tg"
license=('Unlicense')
depends=('python-telegram=0.15.0' 'python3' 'python-setuptools')
optdepends=(
	'libnotify: for notifications, you could also use other programs: see config'
	'ffmpeg: to record voice msgs and upload videos correctly'
	'urlview: to choose urls when there is multiple in message, use URL_VIEW in config file to use another app, it should accept urls in stdin'
	'ranger: can be used to choose file when sending, customizable with FILE_PICKER_CMD'
	'nnn: can be used to choose file when sending, customizable with FILE_PICKER_CMD'
	'fzf: to create groups and secret chats, used for single and multiple user selection'
)
conflicts=('telegram-tg-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"0001-Change-setup.py-to-accept-new-python-telegram-ver.patch")
md5sums=('a9b619805bf79f6f92093e3f96e54125'
         '1977134e8c8fcd093d7081877711255d')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"

	patch -p1 -i "$srcdir/0001-Change-setup.py-to-accept-new-python-telegram-ver.patch"
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	python3 setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
