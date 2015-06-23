_pkgname=vdrpbd
pkgname=${_pkgname}-git
pkgver=1
pkgrel=1
pkgdesc="A daemon to handle ACPI power button event on VDR systems"
url="http://projects.vdr-developer.org/projects/vdrpbd"
arch=('any')
license=('GPL3')
depends=('perl' 'perl-net-dbus')

package() {
  cd ${srcdir}

  _githost="git://projects.vdr-developer.org"
  _gitrepo="${_pkgname}.git"
#  _gitid=

  if [ -e $srcdir/${_pkgname} ]; then	  
    cd $srcdir/${_pkgname}
    git checkout master
    git pull --rebase
    git checkout $_gitid
  else
    git clone ${_githost}/${_gitrepo}
    cd $srcdir/${_pkgname}
    git checkout $_gitid
  fi

  if [ -e $srcdir/${_pkgname}-build ]; then
    rm -rf $srcdir/${_pkgname}-build
  fi

  cp -r $srcdir/${_pkgname} $srcdir/${_pkgname}-build

  cd $srcdir/${_pkgname}-build

#  make DESTDIR=$pkgdir PREFIX=/usr install
  make DESTDIR=$pkgdir PREFIX=/usr BINDIR=/usr/bin install
}
