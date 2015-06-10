# Maintainer: Axilleas P <axilleas archlinux gr>

pkgname=melissi-client-git
pkgver=20110718
pkgrel=1
pkgdesc="A client for Melissi Cloud Storage Server"
arch=('any')
url="http://melissi.org"
license=('GPL3')
depends=('pygobject' 'pygtk' 'glade' 'python-notify' 'python2-pyinotify' 'twisted' 'python2-storm' 'pywebkitgtk' 'pyxdg')
makedepends=('git' 'python2-distribute')
provides=('melissi')
source=()
md5sums=()

_gitroot="git://github.com/melissiproject/client.git"
_gitname="client"

build() {
  
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  
  rm -rf "${srcdir}/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1  	  
      
  install -D -m644 melissi/data/icons/scalable/apps/melissi.svg "${pkgdir}"/usr/share/pixmaps/melissi.svg  
  }
