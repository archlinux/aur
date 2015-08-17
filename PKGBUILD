# Contributor: manveru <m.fellinger@gmail.com>
# Contributor: Florian Richter <Florian_Richter@gmx.de>
# Contributor: b4283
# Maintainer: Alfredo Beaumont <alfredo.beaumont@gmail.com>

pkgname=opendylan
pkgver=2014.1
pkgrel=1
pkgdesc="Dylan is an advanced, object-oriented, dynamic language which supports rapid program development."
arch=(i686 x86_64)
url="http://www.opendylan.org"
license=('custom')
install=opendylan.install
options=(!strip staticlibs)

if [[ $CARCH == "i686" ]]; then
    depends=('glibc')
    source=(http://opendylan.org/downloads/$pkgname/$pkgver/$pkgname-$pkgver-x86-linux.tar.bz2)
    md5sums=('8ed5e060f052710e99cef466a02c7a80')
elif [[ $CARCH == "x86_64" ]]; then
    depends=('glibc' 'gc')
    source=(http://opendylan.org/downloads/$pkgname/$pkgver/$pkgname-$pkgver-x86_64-linux.tar.bz2)
    md5sums=('8e8388f0a6e5d2b0411d7561977d733e')
fi

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/opt/$pkgname
    cp -r $srcdir/$pkgname-$pkgver/{bin,databases,lib,sources,share} $pkgdir/opt/$pkgname
    ln -sf /opt/$pkgname/bin/{dswank,dylan-compiler,make-dylan-app,parser-compiler} $pkgdir/usr/bin/$1
    if [[ $CARCH = "x86_64" ]]; then
      cp -r $srcdir/$pkgname-$pkgver/include $pkgdir/opt/$pkgname
    fi
    install -D -m644 $srcdir/$pkgname-$pkgver/License.txt $pkgdir/usr/share/licenses/$pkgname/License.txt
}
