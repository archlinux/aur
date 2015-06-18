#Maintainer: Daan van Rossum <d.r.vanrossum @ gmx.de>
#Contributor: Jan Oliver Oelerich <janoliver@oelerich.org> 
pkgname=python2-pypdf2-git
pkgver=20131004
pkgrel=1
pkgdesc="PyPDF2 library for Python2"
arch=('i686' 'x86_64')
url="http://mstamy2.github.com/PyPDF2/"
license=('custom')
depends=('python2')
conflicts=('python2-pypdf-git')
makedepends=('git' 'python2-distribute')

_gitroot="https://github.com/mstamy2/PyPDF2.git"
_gitname="PyPDF2"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot 
    cd $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
