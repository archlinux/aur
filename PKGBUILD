# Maintainer: Panos Kanavos <panoskanavos@gmail.com>
_pkgname=mosesdecoder
pkgname=mosesdecoder-git
pkgver=mmt.mvp.v0.12.1.r95.160a7f2
pkgrel=1
pkgdesc="State of the art Statistical Machine Translation system"
arch=('i686' 'x86_64')
url="http://www.statmt.org/moses"
license=('LGPL')
groups=()
depends=('python2' 'xmlrpc-c')
makedepends=('gcc' 'boost>=1.48' 'zlib' 'git' 'libtool'  'boost-libs' 'cmph')
optdepends=('giza-pp-git: for training models'  'mgiza: multithreaded giza for training models')
provides=('mosesdecoder')
conflicts=('mosesdecoder')
replaces=()
backup=()
options=()
install='mosesdecoder.install'
source=("$_pkgname::git+https://github.com/moses-smt/mosesdecoder.git" "mosesdecoder.sh")
noextract=()
md5sums=('SKIP' '888ae605a7b0a816005d44923b523016')

pkgver() {
 cd "$srcdir/$_pkgname"
 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


package() {
  cd "$_pkgname"

  ./bjam --prefix=$pkgdir/opt/moses debug-symbols=off \
	 --with-xmlrpc-c \
	 --with-cmph=/usr \
	 --install-scripts=$pkgdir/opt/moses/moses-scripts \
	 -j4 -q
  mkdir -p $pkgdir/etc/profile.d/
  install -m755 $startdir/mosesdecoder.sh $pkgdir/etc/profile.d/
  source $pkgdir/etc/profile.d/mosesdecoder.sh
}
 
