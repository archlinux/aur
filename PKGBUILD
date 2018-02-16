# Maintainer: Dustin Van Tate Testa <toast27@gmail.com>

pkgname=ys-git
pkgver=v0.1.7.beta.r16.gd7a9ce9 # calls `pkgver()` to replace this number (ver from git)
pkgrel=1
license=('GPL')
pkgdesc="Official interpreter for the YodaScript Language"
url="https://github.com/dvtate/yoda"

arch=('any')
makedepends=('git')

# provides interpreter binary and extension library
provides=('ys' 'yslib.so=1')

# github repo
source=("$pkgname::git+https://github.com/dvtate/yoda")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {

        # configure
        cd $pkgname
        mkdir $pkgdir/usr/
        mkdir $pkgdir/usr/bin/
        mkdir $pkgdir/usr/lib/

        # compile
        make
        make libs

        # install
        install -Dm755 yoda $pkgdir/usr/bin/ys
        install -Dm644 yslib.so $pkgdir/usr/lib/yslib.so
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" # maybe waste of disc space

}





