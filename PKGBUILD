# Maintainer: jackarc
pkgname=purple-battlenet-hg
srcname=purple-battlenet
pkgver=r34.f57c99dd7396
pkgrel=1
pkgdesc="A plugin to login and send whispers to Battle.net v2 users."
arch=('i686' 'x86_64')
url="https://bitbucket.org/EionRobb/purple-battlenet/"
license=('GPL3') 
depends=('pidgin')
makedepends=('libpurple' 'glib2' 'protobuf-c' 'mercurial')
source=('purple-battlenet::hg+https://bitbucket.org/EionRobb/purple-battlenet/')
md5sums=('SKIP')

pkgver() {
 	cd $srcdir/$_srcname
 	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
 }

build() {
    cd $srcdir/$_srcname
    make "CFLAGS += -DBATTLENET_PLUGIN_VERSION='\"\$(PLUGIN_VERSION)\"'"
}


package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="$pkgdir" install
}

