pkgname=flatpak-git
pkgver=1
pkgrel=1
pkgdesc='An application deployment framework for desktop apps'
url='http://www.freedesktop.org/software/flatpak'
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('git' 'docbook-xsl')
depends=('ostree' 'libseccomp' 'fuse' 'libxau' 'json-glib' 'libelf')
_gitroot=("https://github.com/alexlarsson/xdg-app.git")
_gitname="xdg-app"

package() {
  cd "$startdir/src"

  if [ -d "$startdir/src/$_gitname" ] ; then
      cd $_gitname && git pull origin
  else
      git clone "$_gitroot"
      cd $_gitname
  fi

  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc --disable-userns
  make

  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

