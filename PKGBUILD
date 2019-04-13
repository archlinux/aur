# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-efb-telegram-master-git
pkgver=r134.7d4648d
pkgrel=1
pkgdesc='EFB Telegram Master, a channel for EH Forwarder Bot.'
arch=('any')
url='https://github.com/blueset/efb-telegram-master'
license=('AGPL-3')
groups=('efb')
depends=('python-yaml' 'python-ehforwarderbot' 'python-telegram-bot' 'python-magic-ahupp' 'python-moviepy' 'python-imageio-ffmpeg' 'python-peewee' 'python-requests' 'python-pydub' 'python-retrying' 'python-language-tags')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}"::"git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root "$pkgdir"
	install -Dm644 "$srcdir/${pkgname%-git}/LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE.md"
}
