# Maintainer: JinZhongjia <mail @ nvimer.org>

pkgname='zig-zvm-git'
pkgver=0.4.5.r0.gba2e28b5
pkgrel=1
pkgdesc='Fast and simple zig version manager'
arch=('x86_64')
url='https://github.com/hendriknielaender/zvm'
license=('MIT')
makedepends=('zig' 'git')
provides=("zvm" "zig-zvm")
conflicts=('zig-zvm-bin' 'zvm' 'zig-zvm' 'zig')
source=("git+https://github.com/hendriknielaender/zvm.git")
md5sums=('SKIP')


function pkgver(){
	cd "$srcdir/zvm"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/zvm"
    zig build release
}

package() {
    cd "$srcdir/zvm"
    install -Dm755 zig-out/$CARCH-linux-zvm "$pkgdir/usr/bin/zvm"
    ln -s "/usr/bin/zvm" "$pkgdir/usr/bin/zig"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
