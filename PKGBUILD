# Maintainer: Ben Westover <kwestover.kw@gmail.com>
pkgname=python-py-cord-git
pkgver=v1.7.0.r1745.gdad90219
pkgrel=1
pkgdesc="Pycord is a maintained fork of discord.py, a python wrapper for the Discord API - git version for development"
arch=(any)
url="https://github.com/Pycord-Development/pycord"
license=('MIT')
depends=('python' 'python-aiohttp')
makedepends=('python-setuptools' 'git')
optdepends=('python-pynacl: Voice support'
            'libffi: Voice support')
conflicts=('python-discord' 'python-py-cord')
provides=('python-discord' 'python-py-cord' 'python-pycord')
source=("pycord::git+https://github.com/Pycord-Development/pycord.git")
sha256sums=('SKIP')

pkgver() {
	cd pycord
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd pycord
	python setup.py build
}

package() {
	cd pycord
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
