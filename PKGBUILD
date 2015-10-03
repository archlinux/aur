# Maintainer: Panos Kanavos <panoskanavos@gmail.com>
pkgname=mosesdecoder
pkgver=3.0.0
pkgrel=1
pkgdesc="State of the art Statistical Machine Translation system - Stable Release 3"
arch=('i686' 'x86_64')
url="http://www.statmt.org/moses"
license=('LGPL')
groups=()
depends=('python2' 'xmlrpc-c')
makedepends=('gcc' 'boost>=1.48' 'zlib' 'git' 'libtool'  'boost-libs' 'cmph')
optdepends=('giza-pp-git: for training models'  'mgiza: multithreaded giza for training models')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='mosesdecoder.install'
source=('mosesdecoder::git+https://github.com/moses-smt/mosesdecoder.git#branch=RELEASE-3.0' 'mosesdecoder.sh')
noextract=()
md5sums=('SKIP' '888ae605a7b0a816005d44923b523016')

package() {
  cd "$pkgname"

  ./bjam --prefix=$pkgdir/opt/moses debug-symbols=off \
	 --with-xmlrpc-c \
	 --with-cmph=/usr \
	 --install-scripts=$pkgdir/opt/moses/moses-scripts \
	 -j2
  mkdir -p $pkgdir/etc/profile.d/
  install -m755 $startdir/mosesdecoder.sh $pkgdir/etc/profile.d/
  source $pkgdir/etc/profile.d/mosesdecoder.sh
}
 
