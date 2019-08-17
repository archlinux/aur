# @Author: archer
# @Date:   2019-08-02T13:11:00+01:00
# @Last modified by:   archer
# @Last modified time: 2019-08-02T13:31:38+01:00

# Maintainer: George Raven <GeorgeRavenCommunity AT pm dot me>
pkgname=nemesyst-git
_pkgsrcname="nemesyst"
pkgver=2.0.0.r1.d57b1f0
pkgrel=1
pkgdesc="Practical, distributed, hybrid-parallelism, deep learning framework."
arch=('x86_64' 'aarch64')
url="https://github.com/DreamingRaven/nemesyst"
_branch="master"
license=('MIT') # MIT is a special case store a copy in /usr/share/pkgname
groups=("nemesyst-base")
depends=('python-setuptools' 'python' 'python-pymongo' 'python-configargparse')
makedepends=('git')
optdepends=('mongodb: local database creation'
						'python-sphinx: documentation builder'
						'python-sphinx_rtd_theme: documentation theme generator'
						'python-sphinx-argparse: documentation auto generate argument list')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${_pkgsrcname}::git+${url}#branch=${_branch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgsrcname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${srcdir}/${_pkgsrcname}"
	git checkout ${_branch} # get off of makepkg branch
}

build() {
	cd "${srcdir}/${_pkgsrcname}"
}

check() {
	cd "${srcdir}/${_pkgsrcname}"
	# check that program can run while self checking and updating if somethings missing
	python3 ./nemesyst.py --update
}

package() {
	cd "${srcdir}/${_pkgsrcname}"
	python3 ./setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 nemesyst.d/nemesyst.conf "${pkgdir}/etc/nemesyst/nemesyst.d/nemesyst.conf"
}
