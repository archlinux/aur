# Contributor: jason ryan <jasonwryan@gmail.com>
# Contributor: fanglingsu
# Maintainer: <aksr at t-com dot me>
pkgname=vimb-git
pkgver=3.0.0.r1461.46d6f0d
pkgrel=1
epoch=
arch=('i686' 'x86_64')
pkgdesc="A Vim-like web browser that is inspired by Pentadactyl and Vimprobable."
url="https://github.com/fanglingsu/vimb"
url="http://fanglingsu.github.io/vimb"
license=('GPLv3')
depends=('webkit2gtk>=2.8')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('vimb')
conflicts=('vimb' 'vimb2')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/fanglingsu/vimb.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --long --tags | sed -e 's/-alpha/.0/' -e 's/-.*//')" \
                     "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  if [ -e $SRCDEST/config.h ]; then
    msg "Using custom config.h";
    cp $SRCDEST/config.h "$srcdir/$pkgname/src"
  fi
}

build() {
  cd "$srcdir/$pkgname"
  make DEXTENSIONDIR=/usr/lib/vimb V=1 DESTDIR="$pkgdir" PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname"
  make DEXTENSIONDIR=/usr/lib/vimb V=1 DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

