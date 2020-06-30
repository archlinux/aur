# Maintainer: jackarc

pkgname=purple-battlenet-git
_srcname=purple-battlenet
pkgver=0.r39.g9847134
pkgrel=1
pkgdesc="A Pidgin plugin to login and send whispers to Battle.net v2 users."
arch=('i686' 'x86_64')
url="https://github.com/EionRobb/purple-battlenet"
license=('GPL3+') 
depends=('pidgin')
makedepends=('libpurple' 'glib2' 'protobuf-c' 'git')
source=('git+https://github.com/EionRobb/purple-battlenet.git')
md5sums=('SKIP')

pkgver() {
 	cd $srcdir/$_srcname
	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
    cd $srcdir/$_srcname
    make 
}


package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="$pkgdir" install
}


