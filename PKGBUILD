# Maintainer: Kai Yuan <kent.yuan @t gmail d@t com>
pkgname=passwdmanager
pkgver=20140211
pkgrel=1
pkgdesc="Password management tool"
arch=('any')
url="https://github.com/sk1418/passwdmanager"
license=('GPL3')
makedepends=('git')
depends=('python2' 'wxpython' 'python2-crypto' 'python2-setuptools')
#source=("https://github.com/sk1418/${pkgname}/archive/${pkgver}.tar.gz")
#source=("https://passwdmanager.googlecode.com/files/${pkgname}_${pkgver}.tar.gz")
#md5sums=('3c51b7d306e7560f8121c9563eeb24d1')
_gitroot="https://github.com/sk1418/passwdmanager.git"
_gitname="passwdmanager"

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
