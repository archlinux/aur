# Maintainer: Vianney le Clément <vleclement AT gmail · com>
_pkgname=hamster-shell-extension
pkgname=$_pkgname-git
pkgver=20130209.gfc9e077
pkgrel=1
pkgdesc="Shell extension for project hamster - the GNOME time tracker"
arch=(any)
url="https://github.com/projecthamster/shell-extension"
license=('GPL')
depends=('hamster-time-tracker' 'gnome-shell')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_gitname='shell-extension'
source=("git://github.com/projecthamster/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  _date=$(git show -s --format='%ci' | cut -d' ' -f1 | sed 's/-//g')
  _hash=$(git show -s --format='%h')
  echo "${_date}.g${_hash}"
}

package() {
  cd "${srcdir}/${_gitname}"
  _uuid=$(sed -n 's/^.*"uuid"\s*:\s*"\([^"]*\)".*$/\1/p' metadata.json)
  _target="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  mkdir -p "${_target}"
  cp -r * "${_target}"
}

# vim:set ts=2 sw=2 et:
