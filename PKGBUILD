# Maintainer: seiuneko <chfsefefgesfen foxmail>

pkgname=python-efb-qq-slave-git
pkgver=2.0.0b3.r35.g47418ed
pkgrel=1
pkgdesc='EFB QQ Slave, a channel for EH Forwarder Bot.'
arch=('any')
url='https://github.com/milkice233/efb-qq-slave'
license=('GPL3')
groups=('eqs')
depends=('python>=3.6' 'python-ehforwarderbot' 'python-telegram-bot' 'python-requests' 'python-magic' 'python-pyaml' 'python-pillow' 'python-cqhttp' 'ffmpeg')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}"::"git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v\.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"

	python setup.py clean --all
	python setup.py build
}

package() {
	cd "${pkgname%-git}"

	python setup.py install --root "$pkgdir" --optimize=1 --skip-build
}
