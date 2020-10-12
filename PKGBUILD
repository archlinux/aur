# Contributor: manveru <m.fellinger@gmail.com>
# Contributor: Florian Richter <Florian_Richter@gmx.de>
# Contributor: b4283
# Maintainer: Alfredo Beaumont <alfredo.beaumont@gmail.com>

pkgname=opendylan
pkgver=2020.1
pkgrel=1
pkgdesc="Dylan is an advanced, object-oriented, dynamic language which supports rapid program development."
arch=(i686 x86_64 aarch64)
url="http://www.opendylan.org"
license=('custom')
install=opendylan.install
options=(!strip staticlibs libtool)
depends=('clang' 'lld')
optdepends=('lldb: debugging support')
if [[ $CARCH == "aarch64" ]]; then
    source=(https://github.com/dylan-lang/opendylan/releases/download/v$pkgver.0/opendylan-$pkgver-aarch64-linux.tar.bz2)
    sha256sums=('96b7f4a0e7a3d55d204fd67bff3d11424710e15191bf2b953d4c4366a8947205')
elif [[ $CARCH == "i686" ]]; then
    source=(https://github.com/dylan-lang/opendylan/releases/download/v$pkgver.0/opendylan-$pkgver-x86-linux.tar.bz2)
    sha256sums=('8024b3c9c99d4765e9ba9db3cded720cabd0f5555b1c08e1f7af5ffb18be13a1')
elif [[ $CARCH == "x86_64" ]]; then
    source=(https://github.com/dylan-lang/opendylan/releases/download/v$pkgver.0/opendylan-$pkgver-x86_64-linux.tar.bz2)
    sha256sums=('2d1369018fe362c46ec263ddad85c7e7c1bb60d527abadf6f9b159ad9841903e')
fi

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/opt/$pkgname
    cp -r $srcdir/$pkgname-$pkgver/{bin,databases,include,lib,share,sources} $pkgdir/opt/$pkgname
    ln -sf /opt/$pkgname/bin/{dswank,dylan-compiler,dylan-environment,llvm-runtime-generator,make-dylan-app,minimal-console-scepter,parser-compiler} $pkgdir/usr/bin/$1
    install -D -m644 $srcdir/$pkgname-$pkgver/License.txt $pkgdir/usr/share/licenses/$pkgname/License.txt
}
