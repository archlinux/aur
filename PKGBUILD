# @Author: archer
# @Date:   2019-08-02T13:11:00+01:00
# @Last modified by:   archer
# @Last modified time: 2019-08-02T13:31:38+01:00

# Maintainer: George Raven <GeorgeRavenCommunity AT pm dot me>
pkgname=python-missingpy-git
_pkgsrcname="missingpy"
pkgver=r25.49fb1f6
pkgrel=1
pkgdesc="Missing Data Imputation for Python."
arch=('any')
url="https://github.com/epsilon-machine/missingpy"
_branch="master"
license=('GPLv3') # MIT is a special case store a copy in /usr/share/pkgname
groups=()
depends=('python-numpy' 'python-scipy' 'python-scikit-learn')
makedepends=('git')
optdepends=()
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
	# there are no tags of any kind so having to use revisions
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
}

package() {
	cd "${srcdir}/${_pkgsrcname}"
	python3 ./setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
