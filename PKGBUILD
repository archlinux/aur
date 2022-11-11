# Contributor: Charles Leifer
# Maintainer: Sol Bekic <s+aur at s-ol dot nu>

_gitname=themer
_gitbranch=master
pkgname="python-${_gitname}-git"
pkgdesc='colorscheme generator and manager for your desktop'
pkgver=v1.8.4.r0.g473cee2
pkgrel=2
url="https://github.com/s-ol/${_gitname}"
license=('MIT')
arch=('any')
depends=('python' 'python-pillow' 'python-yaml' 'python-jinja' 'python-requests')
optdepends=('i3-wm: default-supported windowmanager' 'fish: supports completion')
makedepends=('git' 'python-setuptools')
install="${_gitname}.install"
source=("${_gitname}::git+https://github.com/s-ol/${_gitname}.git#branch=${_gitbranch}"
        "${install}")
sha256sums=('SKIP'
            '5783163020b902b4c155155948e0df3d859877961a85f965318a5ff161a3e06a')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_gitname}"
  python setup.py install --root="${pkgdir}" --optimize=1

  # License
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"

  cd data/

  # Fish Completion
  install -Dm644 "fish/themer.fish" "${pkgdir}/usr/share/fish/completions/${_gitname}.fish"

  # Default Configuration
  find default -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/${_gitname}/{}" ';'
}
