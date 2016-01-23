# Maintainer: Theo J.A. de Vries <t.j.a.devries(at)gmail(dot)com>

# for customization
_pkgname=mongoose-server
_ext=
_basedir=/usr
_gitname=mongoose-server
# note: depends=() needs separate customization

pkgname=${_pkgname}${_ext}
pkgver=6.2
pkgrel=1
pkgdesc="An easily configurable cross-platform http server based on mongoose and libconfig."
arch=('i686' 'x86_64')
url="https://bitbucket.org/theojadevries/$_gitname"
license=("GPL2")
groups=()
#depends=("libconfig" "mongoose")
depends=("libconfig")
makedepends=("git" "cmake")
optdepends=()
#provides=()
#conflicts=()
backup=('etc/mongoose-server/mongoose-server.conf')
#options=()
#install=

source=(
         "https://bitbucket.org/theojadevries/$_gitname/downloads/$pkgname-$pkgver.tar.gz"
         mongoose-server.service
        )

build() {
  install -d $srcdir/build
  cd $srcdir/build
  cmake -DMONGOOSE-SERVER_EMBED_MONGOOSE=ON -DCMAKE_INSTALL_PREFIX:PATH=${pkgdir}${_basedir} ../
  make
#  make test
}

package() {
  cd $srcdir/build
  make install

  #Install configuration file and service
  cd "$srcdir"
  install -Dm644 conf/$pkgname.conf ${pkgdir}/etc/$pkgname/$pkgname.conf
  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
}

md5sums=('c5a30d107a042960194118d74ac760ab'
         '9b63b578ee8130da91bddb4eba560725')
