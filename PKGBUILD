pkgname='vmjk-git'
_pkgname="vmjk"
pkgver=0.1.0.9.g71f1ff7
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/suhr/vmjk"
pkgdesc="Virtual midi janko keyboard"
license=('unknown')
depends=('csfml' 'portmidi')
makedepends=('rust' 'cargo' 'git')
provides=('vmjk')
conflicts=('vmjk')
source=("$_pkgname::git+https://github.com/suhr/vmjk.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
  cd $_pkgname
  sed -i "s/portmidi = \"^0.2\"/portmidi = \"=0.2.4\"/g" Cargo.toml
  env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd $_pkgname

	install -D -m755 "target/release/vmjk" "$pkgdir/usr/bin/vmjk"
}
