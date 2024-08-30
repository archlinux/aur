# Maintainer: weipeng <weipeng1999@qq.com>
_name=nclcmaps
pkgname="python-${_name}-git" # '-bzr', '-git', '-hg' or '-svn'
pkgver=r3.b0e2b7fpy
pkgrel=1
pkgdesc="NCL colormaps in Python"
arch=("any")
url="https://github.com/samwisehawkins/nclcmaps"
license=('NOLICENSE')
groups=()
depends=("python-numpy" "python-matplotlib")
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${_name}::git+https://github.com/samwisehawkins/${_name}")
noextract=()
sha256sums=('SKIP')
python_version="$(python -V)"
version="${python_version#Python }"

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "${_name}"
	printf "r%s.%spy%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_name}"
}
package() {
	cd "${_name}"
    site_path="/usr/lib/python${version%.*}/site-packages"
    install_path="${pkgdir}/${site_path}"
    echo $pkgdir
    mkdir -p "${install_path}"
    install -m 644 "${_name}.py" "${install_path}"
}
