# Maintainer: <me at adambac dot com>

pkgname='webhttrack-git'
pkgver='3.48.21.55.g68efe9e'
pkgrel=1
pkgdesc='HTTrack is a free (GPL, libre/free software) and easy-to-use offline browser utility.'
license=(GPL)
url='https://github.com/xroche/httrack'
arch=('any')
provides=('webhttrack' 'httrack')
conflicts=('webhttrack' 'httrack')
makedepends=('git')
depends=('bash' 'zlib' 'hicolor-icon-theme' 'openssl')
source=('git://github.com/xroche/httrack'
        'git://github.com/xroche/coucal')
md5sums=('SKIP' 'SKIP')

_gitname='httrack'

pkgver() {
    cp coucal/* ${_gitname}/src/coucal/
    cd "$_gitname"
    git describe | sed -e 's/-/./g'
}

build() {
    cd "$_gitname"
    ./configure --prefix=/usr
    make -j8
}

package() {
    cd "$_gitname"
    make DESTDIR="${pkgdir}/" install
}
