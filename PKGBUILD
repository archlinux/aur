# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef-git
_pkgname=pacdef
pkgver=0.7.3+r60.gd4762ec
pkgrel=1
pkgdesc='declarative package manager for Arch Linux'
url='https://github.com/steven-omaha/pacdef'
source=("git+https://github.com/steven-omaha/${_pkgname}")
arch=('any')
license=('GPL3')
depends=('python' 'pyalpm')
conflicts=('pacdef')
provides=('pacdef')
makedepends=('git' 'python-pip')
checkdepends=('python-pytest' 'python-mock')
sha256sums=(SKIP)

build() {
  cd "${srcdir}/${_pkgname}"
  sed -i -e "s/version = \".*\"/version = \"${pkgver}\"/" pyproject.toml
}

check() {
  cd "${srcdir}/${_pkgname}"
  python -m pytest
}

package() {
  cd "${srcdir}/${_pkgname}"
  pip install --root="${pkgdir}/" --no-deps --ignore-installed .
  install -Dm644 _completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pacdef"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/+/;s/-/./g'
}
