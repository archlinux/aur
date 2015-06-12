# Maintainer: Jozef Riha <jose1711@gmail.com>

pkgname=photo-uploader-svn
pkgver=20110518
pkgrel=1
pkgdesc="Python script for uploading photos to photolabs (SVN version)"
arch=('i686' 'x86_64')
url="http://cz.cihar.com/software/photo-uploader/"
license=('GPL')
depends=('python-pycurl' 'python2')
provides=('photo-uploader')
conflicts=('photo-uploader')

_gitroot="git://gitorious.org/photo-uploader/photo-uploader.git"
_gitname="photo-uploader"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd $srcdir/photo-uploader
  python2 setup.py install --root=$pkgdir/ --prefix=/usr
}
