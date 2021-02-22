# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=tg
pkgname=telegram-$_pkgname
pkgver=0.7.0
pkgrel=4
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
)
conflicts=('telegram-tg-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"0001-Change-setup.py-to-accept-new-python-telegram-ver.patch"
	"0002-Fix-compatibility-with-new-libtd-version.patch")
md5sums=('2326260f8db97f4254657c64b6542e55'
         '7b9a556ce7d2203fbee32442a96d73bc'
         '13f56d00337b141c270906f0df49e872')

prepare() {
	cd "${_pkgname}-${pkgver}"
	patch -p1 -i ${srcdir}/0001-Change-setup.py-to-accept-new-python-telegram-ver.patch
	patch -p1 -i ${srcdir}/0002-Fix-compatibility-with-new-libtd-version.patch
}

build() {
	cd "$_pkgname-$pkgver"

	python3 setup.py build
}

package() {
	cd "$_pkgname-$pkgver"

	python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
