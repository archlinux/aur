# Maintainer: George Raven <GeorgeRavenCommunity AT pm dot me>
pkgname=python-rotepy-git
_pkgsrcname="rotepy"
pkgver=0.1.0.r1.gf067d52
pkgrel=1
pkgdesc="Basic, repeat ML operations."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/GeorgeRaven/rotepy.git"
_branch="master"
license=("OSL-3.0") # open software licence v3
groups=()
depends=('python-setuptools' 'python' "python-configargparse" "python-numpy" "python-tqdm" "python-seaborn" "python-pytorch")
makedepends=('git')
optdepends=()
provides=("python-rotepy" "rotepy")
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
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgsrcname}"
  git checkout ${_branch} # get off of makepkg branch
}

build() {
  cd "${srcdir}/${_pkgsrcname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgsrcname}"
  python setup.py install --root="$pkgdir" --optimize=1
}
