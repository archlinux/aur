# Maintainer: Christian Zugno < chriszugno [at] gmail [dot] com >
# Maintainer: dllud <dllud riseup net>
# Contributor: Kazuo Teramoto < kaz.rag [at] gmail [dot] com >

pkgname=stig-git
pkgver=v0.12.12a0.r0.gdfc1cec
pkgrel=1
pkgdesc='TUI and CLI client for the Transmission daemon'
url='https://github.com/rndusr/stig'
depends=('python' 'python-urwid' 'python-urwidtrees' 'python-aiohttp'
	 'python-pyxdg' 'python-blinker' 'python-natsort' 'python-async-timeout')
makedepends=('git' 'python-setuptools')
optdepends=('python-aiohttp-socks: proxy support'
	    'python-pprofile: profiling'
	    'python-setproctitle: prettifies the process name')
license=('GPL-3.0-or-later')
arch=('any')
provides=('stig')
conflicts=('stig')
source=("git+https://github.com/rndusr/stig.git")
sha256sums=('SKIP')

pkgver() {
	cd stig
	printf "%s" "$(git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd stig
	python setup.py build
}

package() {
	cd stig
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
