# Maintainer: SelfRef <arch@selfref.dev>

_basename=exscript
pkgname="python-${_basename}-git"
pkgver=2.6.30
pkgrel=2
pkgdesc="A Python module making Telnet and SSH easy"
arch=('any')
url="https://github.com/knipknap/exscript"
license=('MIT')
conflicts=("python-${_basename}")
provides=("python-${_basename}")
depends=('python' 'python-future' 'python-configparser' 'python-pycryptodomex' 'python-paramiko>=1.17')
makedepends=('git' 'python-setuptools')
source=("${_basename}"::"git+https://github.com/knipknap/exscript.git")
md5sums=('SKIP')

pkgver() {
	cd ${_basename}
	git describe $HEAD --tags --match "v[0-9]*" | sed 's/^v//;s/-[^\-]*$//;s/-/./'
}

build() {
	cd ${_basename}
	sed -i "s/DEVELOPMENT/$pkgver/" ./Exscript/version.py
	python setup.py build
}

package() {
	cd ${_basename}
	python setup.py install --root="$pkgdir" --optimize=1
}
