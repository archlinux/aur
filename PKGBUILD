# Contributor: Charles Leifer
# Maintainer: Sol Bekic <s+aur at s-ol dot nu>

_gitname=themer
_gitbranch=master
pkgname="python-${_gitname}-git"
pkgdesc='Themer is a colorscheme generator and manager for your desktop.'
pkgver=0.0.0
pkgrel=5
url="https://github.com/s-ol/${_gitname}"
license=('MIT')
arch=('any')
depends=('python' 'python-pillow' 'python-yaml' 'python-jinja' 'python-requests')
optdepends=('i3-wm: default-supported windowmanager' 'fish: supports completion')
makedepends=('git' 'python-setuptools')
install="${_gitname}.install"
source=("${_gitname}::git://github.com/s-ol/${_gitname}.git#branch=${_gitbranch}"
        "${install}")
sha256sums=('SKIP'
            '3fc9aa9b92cbb7dbbc0b30323faf3744c30abb7d6d365331a5b8a623355987a5')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_gitname}"
  python setup.py install --root="${pkgdir}" --optimize=1

  # Default Configuration
  install -Dm644 "data/default" "${pkgdir}/usr/share/${_gitname}/default"

  # Fish Completion
  install -Dm644 "data/fish/themer.fish" "${pkgdir}/usr/share/fish/completions/${_gitname}.fish"

  # License
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}
