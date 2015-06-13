# Maintainer: Daniel Maslowski <info at orangecms dot org>
pkgname=j4status-plugins-git
_gitname=j4status-plugins
pkgver=30.98a8146
pkgrel=1
pkgdesc="Plugins for j4status"
arch=('i686' 'x86_64')
url="http://j4status.j4tools.org/j4status-plugins/"
license=('GPL')
provides=('j4status-plugins')
depends=('glibc' 'j4status')
makedepends=('git' 'docbook-xsl')
optdepends=('alsa-lib: Audio status'
            'i3ipc-glib: i3 focus')
options=('!libtool')
source=('git://github.com/j4tools/j4status-plugins.git'
        'git://github.com/sardemff7/libgwater.git')
sha256sums=('SKIP'
            'SKIP')

pkgver()
{
  cd "${srcdir}/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare()
{
  cd "${srcdir}/${_gitname}"
  git submodule init
  git config submodule.libgwater.url "${srcdir}/libgwater"
  git submodule update
}

build()
{
  cd "${srcdir}/${_gitname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package()
{
  cd "${srcdir}/${_gitname}"
  make DESTDIR=${pkgdir} install
}
