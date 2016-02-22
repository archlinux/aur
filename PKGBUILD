# Maintainer: Kai Michaelis <seu@panopticon.re>
pkgname=panopticon-git
pkgver=0.13
pkgrel=1
pkgdesc="A libre cross platform disassembler"
arch=('x86_64' 'i686')
url="https://panopticon.re/"
license=('GPL3')
groups=('devel')
depends=(
    'glpk>=4'
    'qt5-quickcontrols>=5.4')
makedepends=(
    'rust'
    'cargo'
    'git>=1'
    'cmake>=2.8.9')
provides=('panopticon')
conflicts=('panopticon')
source=($pkgname::git+https://github.com/das-labor/panopticon.git)
md5sums=('SKIP')

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    install -d -m 755 "$pkgdir/usr/bin"
    install -D -s -m 555 "$pkgname/target/release/qtpanopticon" "$pkgdir/usr/bin/qtpanopticon"
	install -m 755 -d "$pkgdir/usr/share/panopticon/qml"
	cp -R "$pkgname/qt/res/"* "$pkgdir/usr/share/panopticon/qml"
	chown -R root:root "$pkgdir/usr/share/panopticon/qml"
}
