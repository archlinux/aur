# Maintainer:
# Contributor: Muhammad Sayuti <muhammad.sayuti94@gmail.com>

pkgname=lightdm-webkit-theme-luminos-git
_pkgname=luminos
pkgver=0.5.0.r13.g8ac0dc1
pkgrel=1
pkgdesc="Customizable LightDM Webkit Greeter Theme"
arch=('any')
url="https://github.com/linuxaddict89/lightdm-webkit-theme-luminos"
license=('GPL-3.0-or-later')
depends=('lightdm' 'lightdm-webkit2-greeter')
makedepends=('git')
source=("git+${url}.git")
provides=('lightdm-webkit-theme-luminos')
conflicts=('lightdm-webkit-theme-luminos')
md5sums=('SKIP')
_gitname="lightdm-webkit-theme-luminos"

pkgver() {
  cd $_gitname
  git describe --long --tags | sed -r 's/-([0-9]+)-g/.r\1.g/'
}

package()
{
  cd "${pkgdir}"
  mkdir -p usr/share/lightdm-webkit/themes
  cd usr/share/lightdm-webkit/themes
  cp -dpr --no-preserve=ownership "${srcdir}/${_gitname}" ${_pkgname}
  echo "Removing .git files"
  cd ${_pkgname}
  rm -rf .git
  rm -f .gitignore
  echo "Removing dev files"
  rm -rf node_modules
  rm -rf tasks
  rm -f package.json
  rm -f yarn.lock
  rm -f PKGBUILD
  rm -f install.sh
}
