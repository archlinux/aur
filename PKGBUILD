# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=karma-git
_pkgname=karma
pkgver=r22.4311af4
pkgrel=1
pkgdesc="Search of Emails and Passwords on Pwndb"
arch=('any')
url="https://github.com/decoxviii/karma"
license=('MIT')
depends=('python' 'python-docopt' 'python-requests' 'python-pysocks' 'python-texttable')
makedepends=('git')
provides=("karma")
conflicts=("karma")
install=
source=("${_pkgname}::git+https://github.com/decoxviii/karma.git"
	"path_change.patch")
sha256sums=('SKIP'
            '1c10f1eb45312b46c526d560d4d2e2842de2e86065cb9d3a8938189e96838a20')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  # Adjust path declaration
  patch -i path_change.patch "${_pkgname}/bin/karma.py"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # main prog
  #install -Dm755 "bin/karma.py" "${pkgdir}/usr/share/${_pkgname}/bin/karma.py"
  install -Dm755 "bin/karma.py" "${pkgdir}/usr/bin/karma.py"
  install -Dm644 "karma/__init__.py" "${pkgdir}/usr/share/${_pkgname}/karma/__init__.py"
  install -Dm644 "karma/core.py" "${pkgdir}/usr/share/${_pkgname}/karma/core.py"
  install -Dm644 "karma/banner.py" "${pkgdir}/usr/share/${_pkgname}/karma/banner.py"

  # misc philes
  install -Dm644 "README.md" "${pkgdir}/usr/share/${_pkgname}/README.md"
  install -Dm644 "requirements.txt" "${pkgdir}/usr/share/${_pkgname}/requirements.txt"
  install -Dm644 "screenshot.png" "${pkgdir}/usr/share/${_pkgname}/screenshot.png"
}

