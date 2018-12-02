# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: user6553591 <Message on Reddit>
# Contributor: P. Badredin <p dot badredin at gmail dot com>
# Contributor: Justin Blanchard <UncombedCoconut at gmail dot com>
# Contributor: Auguste Pop < auguste [at] gmail [dot] com >

pkgname=stockfish
pkgver=10
pkgrel=1
epoch=1
pkgdesc="A strong chess engine written by Tord Romstad, Marco Costalba, Joona Kiiski"
arch=('i686' 'x86_64')
url="https://stockfishchess.org/"
license=('GPL3')
depends=('glibc')
source=("https://${pkgname}.s3.amazonaws.com/${pkgname}-${pkgver}-src.zip")
sha512sums=('e198a9193d6ac3c16fcb2243d162ab67e6033ab85d900bb9fee8494b91c0608525269cf708bdbc3376c3812b0700df8cccbcddde582079c5e03680cb02dc900d')

build() {
    cd "$srcdir/src"

    if [[ "$CARCH" == "i686" ]]; then
	_arch=x86-32
    elif grep popcnt /proc/cpuinfo 2>&1; then
	_arch=x86-64-modern
    else
	_arch=x86-64
    fi
    
    make profile-build ARCH=$_arch
}

package() {
    cd "$srcdir/src"
    make PREFIX="$pkgdir/usr" install
}
