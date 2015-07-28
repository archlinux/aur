# Maintainer: Kai Yuan <kent.yuan @t gmail d@t com>
pkgname=tinyswitch
pkgver=1.1.0
pkgrel=2
pkgdesc="commandline tool to switch tinyproxy based proxy conveniently"
arch=('any')
url="https://github.com/sk1418/tinyswitch"
license=('GPL3')
depends=('python2' 'tinyproxy')
#source=("https://github.com/sk1418/${pkgname}/archive/${pkgver}.tar.gz")
#source=("https://tinyswitch.googlecode.com/files/${pkgname}_${pkgver}.tar.gz")

_gitroot="https://github.com/sk1418/tinyswitch.git"
_gitname="tinyswitch"
package() {
  cd ${srcdir}/
  msg "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot}
      fi
    cd "${srcdir}/${_gitname}" 
    git checkout master
    msg "GIT checkout done."

  cd "$srcdir/${pkgname}"
  find . -name "*.py" |xargs sed -i "s|/usr/bin/python|&2|" 

  python2 setup.py install --root="$pkgdir" --prefix="/usr" || return 1
}

# vim:set ts=2 sw=2 et:
