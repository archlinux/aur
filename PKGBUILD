# Maintainer: George Raven <GeorgeRavenCommunity AT outlook dot com>
pkgname=nemesyst-git
pkgsrcname="nemesyst"
pkgver=0.9.5.r23.3c41545
pkgrel=1
pkgdesc="Generalised, sequence-based, deep-learning framework of the gods. Warning may include GANs, does not include nuts."
arch=('x86_64')

# nemesyst source code url
url="https://github.com/DreamingRaven/Nemesyst"
# set what branch you would like to pull from
branch="master"

license=('MIT') # MIT is a special case store a copy in /usr/share/pkgname
groups=("nemesyst-base")
depends=('git' 'python-setuptools' 'mongodb' 'python' 'python-pymongo' 'python-keras' 'python-keras-applications' 'python-keras-preprocessing' 'python-pandas' 'python-numpy' 'python-h5py' 'python-pydot')
makedepends=() # 'bzr', 'git', 'mercurial' or 'subversion'
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('nemesyst::git+https://github.com/DreamingRaven/Nemesyst#branch='"${branch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgsrcname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgsrcname}"
	git checkout ${branch} # get off of makepkg branch
}

build() {
	cd "$srcdir/${pkgsrcname}"
}

check() {
	cd "$srcdir/${pkgsrcname}"
	# check that program can run while self checking and updating if somethings missing
	python3 nemesyst.py --toUpdate
}

package() {
	cd "$srcdir/${pkgsrcname}"
	python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
