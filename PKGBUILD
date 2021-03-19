# Maintainer      : Emilia Stoyanova <emiliaps31+aur@gmail.com>
# Upstream Authors:
#                   Alexey Nezhdanov <snakeru@gmail.com>
#                   Norman Rasmussen <norman@rasmussen.co.za>


_pkgname=xmpppy
pkgname=python2-${_pkgname}-git
pkgver() { git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'; }
pkgver=0.6.2.r0.gef1cbd6
pkgrel=1
pkgdesc="Python 2/3 implementation of XMPP (RFC3920, RFC3921)."
arch=('any')
url="https://github.com/xmpppy/${_pkgname}"
license=('GPL3')
depends=("python2" "python2-setuptools")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url.git#branch=master")
md5sums=('SKIP')

#check() {
#	cd "$srcdir/$_pkgname"
#	pytest2
#}

build() {
	cd "$srcdir/$_pkgname"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	export PYTHONHASHSEED=0
	python2 setup.py install  --root "${pkgdir}" --optimize 1 --skip-build || return 1
}
