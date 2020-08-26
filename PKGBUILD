# Maintainer: Stefan Göbel < snot ʇɐ subtype ˙ de >

pkgname='snot'
_reltag='0.3-pie'
pkgver='0.3'
pkgrel='1'
pkgdesc='Basic Btrfs snapshot tool.'
arch=('x86_64' 'i686')
url='https://gitlab.com/goeb/snot'
license=('GPL3')
depends=('btrfs-progs')
makedepends=('git' 'go' 'python-docutils')
source=("$pkgname::git+https://gitlab.com/goeb/$pkgname.git#tag=$_reltag")
sha256sums=('SKIP')
backup=(
   'etc/pacman.d/hooks/snot.hook'
   'etc/snot/create.conf'
   'etc/snot/create.init'
   'etc/snot/delete.conf'
   'etc/snot/delete.init'
   'etc/snot/list.conf'
   'etc/snot/list.init'
   'etc/snot/restore.conf'
   'etc/snot/restore.init'
)

build() {

   export GOCACHE="$srcdir/.gocache"
   export CGO_CPPFLAGS="${CPPFLAGS}"
   export CGO_CFLAGS="${CFLAGS}"
   export CGO_CXXFLAGS="${CXXFLAGS}"
   export CGO_LDFLAGS="$LDFLAGS"
   export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"

   cd "$pkgname"

   make
   make docs

}

check() {

   cd "$pkgname"

   make testall

}

package() {

   cd "$pkgname"

   make DESTDIR="$pkgdir/" PREFIX="/usr" install
   make DESTDIR="$pkgdir/" PREFIX="/usr" docs-install
   make DESTDIR="$pkgdir/" PREFIX="/usr" arch-install

}

# :indentSize=3:tabSize=3:noTabs=true:mode=shellscript:maxLineLen=78: ########
