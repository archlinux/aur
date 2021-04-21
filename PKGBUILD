# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=tg
pkgname=telegram-$_pkgname
pkgver=0.8.0
pkgrel=1
pkgdesc="terminal telegram client that really works"
arch=('any')
url="https://github.com/paul-nameless/tg"
license=('Unlicense')
depends=('python-telegram' 'python3')
makedepends=('python-setuptools')
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
md5sums=('4456e09339b7070c9f03e6944b400db7'
         '7b9a556ce7d2203fbee32442a96d73bc')

prepare() {
	cd "${_pkgname}-${pkgver}"
	patch -p1 -i ${srcdir}/0001-Change-setup.py-to-accept-new-python-telegram-ver.patch
}

build() {
	cd "$_pkgname-$pkgver"

	python3 setup.py build
}

package() {
	cd "$_pkgname-$pkgver"

	python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
