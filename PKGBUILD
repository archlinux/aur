# Maintainer: Jan Bader <c.arch@jan.javil.eu>
pkgname=brotherhood-gui-git
pkgver=20150607
pkgrel=1
pkgdesc="This is a cross plattform client for the Captcha Brotherhood network. Its main feature is the ability to solve captchas in Linux."
url="http://github.com/gidder/brotherhood-gui"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('python-pyqt4')
makedepends=('git')
install='brothersolver.install'

_gitroot="git://github.com/gidder/brotherhood-gui.git"
_gitname="brotherhood-gui"

build() {
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "${srcdir}/$_gitname"
  mkdir -p tmphome
  HOME="${srcdir}/$_gitname/tmphome" ./setup.py install --user
  
}

package() {

  mkdir -p $pkgdir/usr

  cp -rp $srcdir/$_gitname/tmphome/.local/lib $pkgdir/usr/
  cp -rp $srcdir/$_gitname/tmphome/.local/bin $pkgdir/usr/
  chmod -R 755 $pkgdir/usr/lib
}

# vim:set ts=2 sw=2 et:
