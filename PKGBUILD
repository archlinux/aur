# Maintainer: aksr <aksr at t-com dot me>
pkgname=dwb-belllabs-git
pkgver=20150517.r25.gd20c709
pkgrel=3
epoch=
pkgdesc="A fork of the original Documenter's Workbench Release 3.3."
arch=('i686' 'x86_64')
url="https://github.com/n-t-roff/DWB3.3"
license=('EPL')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('dwb-belllabs')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/n-t-roff/DWB3.3.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname"
  _prefix="opt/" # "usr/" changed to "opt/" to avoid conflicts
  make -f dwb.mk ROOT="$pkgdir/" \
                 BINDIR="$pkgdir/$_prefix/dwb/bin" \
                 FONTDIR="$pkgdir/$_prefix/dwb/lib/font" \
                 HOSTDIR="$pkgdir/$_prefix/dwb/lib/font/postscript" \
                 POSTLIB="$pkgdir/$_prefix/dwb/lib/postscript" \
                 LIBDIR="$pkgdir/$_prefix/dwb/lib/dwb" \
                 MACRODIR="$pkgdir/$_prefix/dwb/lib/macros" \
                 MAN1DIR="$pkgdir/$_prefix/dwb/man/man1" \
                 MAN5DIR="$pkgdir/$_prefix/dwb/man/man5" \
                 NTERMDIR="$pkgdir/$_prefix/dwb/lib/nterm" \
                 POSTBIN="$pkgdir/$_prefix/dwb/bin/postscript" \
                 POSTLIB="$pkgdir/$_prefix/dwb/lib/postscript" \
                 PUBDIR="$pkgdir/$_prefix/dwb/pub" \
                 RASTDIR="$pkgdir/$_prefix/dwb/lib/raster" \
                 TMACDIR="$pkgdir/$_prefix/dwb/lib/tmac" install
}

