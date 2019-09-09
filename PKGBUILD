# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-efb-wechat-slave-git
pkgver=r148.5f033a9
pkgrel=1
pkgdesc='EFB WeChat Slave, a channel for EH Forwarder Bot.'
arch=('any')
url='https://github.com/blueset/efb-wechat-slave'
license=('AGPL-3')
groups=('efb')
depends=('python-ehforwarderbot' 'python-itchat' 'python-magic-ahupp' 'python-pillow' 'libwebp' 'python-pyqrcode' 'python-xmltodict' 'python-yaml' 'python-requests' 'python-typing-extensions' 'python-bullet' 'python-cjkwrap')
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
