# Maintainer: Jesse R. Adams <jesse -at- techno -dash- geeks -dot- org>
pkgname=obvious-git
pkgver=20100621
pkgrel=1
pkgdesc="Widgets for awesome wm (latest version)"
arch=(any)
url="https://github.com/hoelzro/obvious"
license=('custom:MIT')
depends=('awesome')
makedepends=('git')
source=()
md5sums=()

_gitroot=https://github.com/hoelzro/obvious.git
_gitname=obvious

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  install -d ${pkgdir}/usr/share/awesome/lib/${_gitname} || return 1
  cp -a ${_gitname}/* ${pkgdir}/usr/share/awesome/lib/${_gitname} || return 1
  rm ${pkgdir}/usr/share/awesome/lib/${_gitname}/{AUTHORS,CONTRIBUTING.md,LICENSE,TODO} || return 1
  install -Dm644 ${_gitname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
}
