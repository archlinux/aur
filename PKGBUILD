# @Author: George Onoufriou <georgeraven>
# @Date:   2019-01-09
# @Filename: PKGBUILD
# @Last modified by:   georgeraven
# @Last modified time: 2019-01-09
# @License: Please see LICENSE in project root.
# @Copyright: George Onoufriou



# Maintainer: George Raven <GeorgeRavenCommunity AT outlook dot com>
pkgname=tosv-git
pkgsrcname="tosv"
pkgver=0.0.1.r0.773de77
pkgrel=1
pkgdesc="Simple delimited file type converter"
arch=('any')

# nemesyst source code url
url="https://github.com/DreamingRaven/tosv"
# set what branch you would like to pull from
branch="master"

license=('MIT') # MIT is a special case store a copy in /usr/share/pkgname
groups=()
depends=('git' 'python-setuptools' 'python')
makedepends=() # 'bzr', 'git', 'mercurial' or 'subversion'
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${pkgsrcname}"'::git+'"${url}"'#branch='"${branch}")
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
	python3 "${pkgsrcname}" -h
}

package() {
	cd "$srcdir/${pkgsrcname}"
	python3 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
