# Maintainer: picked name <ipickedaname@mail.com>
pkgname=heca
pkgver=1.1.0
pkgrel=1
makedepends=('rust' 'cargo')
depends=('gcc-libs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Hebrew calendar utility"
license=('MIT')
url="https://github.com/heca-project/heca"
source=("https://github.com/heca-project/heca/archive/${pkgver}.tar.gz")
md5sums=('5b92b2ba45d68f6621fe30429399f524')

check() {
	cd $srcdir/"heca-${pkgver}"
	cargo test --release --locked

}
build() {

	    cd $srcdir/"heca-${pkgver}"
	    cargo build --locked --release
    }

package() {

	    cd $srcdir/"heca-${pkgver}"
	    find . -name ".crates.toml"
	    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
	    mkdir -p $pkgdir/usr/share/licenses/heca
	    install ./LICENSE $pkgdir/usr/share/licenses/heca/LICENSE
	}
