# Maintainer:  twa022 <twa022 at gmail dot com>

_base=nordic-themes
_branch=bluish-accent
_pkgname=nordic-${_branch}-theme

pkgname=nordic-${_branch}-theme-git
pkgver=r200+939b027
pkgrel=1
pkgdesc="Nordic ${_branch} theme (git checkout)"
arch=('any')
url="https://github.com/EliverLara/Nordic/"
license=('GPL')
makedepends=('git')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_base}::git+${url}#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${_base}"
  printf 'r%s+%s' `git rev-list --count HEAD` `git rev-parse --short HEAD`
}

package() {
  mkdir -p "${pkgdir}"/usr/share/themes/
  local _directory=Nordic-${_branch}
  cp -r "${_base}" "${pkgdir}"/usr/share/themes/${_directory}
  rm -fr "${pkgdir}"/usr/share/themes/${_directory}/{.git,src,Art,Gulpfile.js,package{,-lock}.json,LICENSE,README.md}
  find "${pkgdir}"/usr/share/themes/${_directory} -type d -exec chmod 755 '{}' \;
  find "${pkgdir}"/usr/share/themes/${_directory} -type f -exec chmod 644 '{}' \; 
}
