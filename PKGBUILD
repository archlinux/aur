# Maintainer: Jianhui Z <jianhui@outlook.com>
# Contributor: Tau Tsao <realturner at gmail.com>
_githash=8904252
pkgname=xrdp-git
pkgver=0.9.0.$_githash
pkgrel=1
pkgdesc="An open source remote desktop protocol(rdp) server - GIT version"
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/xrdp"
license=('Apache')
groups=()
depends=('libxrandr' 'tigervnc' 'fuse')
makedepends=('git' 'autoconf' 'automake' 'libtool')
optdepends=('autocutsel: easy clipboard handling')
provides=()
conflicts=('xrdp')
replaces=()
backup=('etc/xrdp/sesman.ini' 'etc/xrdp/xrdp.ini')
options=()
install=xrdp-git.install
changelog=
source=("$pkgname::git+https://github.com/neutrinolabs/xrdp.git#commit=$_githash"
        "arch-config.diff"
        "archlinux.bmp")
noextract=()
md5sums=('SKIP'
         '44a4b78459738b76db1d3fe8605aa1f2'
         'fc66ae93316811ac5fa1e0960a88f157')

prepare() {
  cd $pkgname
  patch -p1 < ../arch-config.diff
}

build() {
  cd $pkgname
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin --enable-fuse
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 "$srcdir/archlinux.bmp" "$pkgdir/usr/share/xrdp/archlinux.bmp"
}
