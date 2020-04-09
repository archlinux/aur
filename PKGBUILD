pkgbase=bluespec
pkgname=(bluespec-tools bluespec-docs)
pkgver=2019.05.beta2
pkgrel=1
pkgdesc='Bluespec SystemVerilog Tools'
url='http://forum.bluespec.com'
arch=(x86_64)
license=(custom)
depends=(glibc libstdc++5 gmp4)
makedepends=()
options=(!strip)
optdepends=(
	'emacs: Syntax highlight with emacs'
	'vim: Syntax highlight with vim'
)
source=('https://s3.wasabisys.com/bluespec/downloads/Bluespec-2019.05.beta2/Bluespec-2019.05.beta2-centos7-amd64.tar.gz')
sha256sums=('99bc63f992f80d983b22f50e660a39268a997caed1f484b97161949c7ccf13e4')

BUILD_DIR=build

prepare() {
	cat <<EOF > bluespec-home.sh
export BLUESPECDIR="/opt/bluespec"
EOF
}

package_bluespec-tools() {
	cd "$srcdir"
	install -d "$pkgdir/etc/profile.d"
	install -Dm 755 ./bluespec-home.sh "$pkgdir/etc/profile.d/"

	cd "Bluespec-${pkgver}-centos7-amd64"
	install -d "$pkgdir/opt/bluespec"
	cp -r ./lib/* "$pkgdir/opt/bluespec/"
	install -d "$pkgdir/usr/bin"
	install -Dm 755 ./bin/* "$pkgdir/usr/bin/"

	install -d "$pkgdir/usr/share/vim/vimfiles"
	cp -r ./util/vim/{ftdetect,indent,syntax} "$pkgdir/usr/share/vim/vimfiles/"
}

package_bluespec-docs() {
	cd "$srcdir/Bluespec-${pkgver}-centos7-amd64"
	install -d "$pkgdir/usr/share/doc"
	cp -r ./doc/* "$pkgdir/usr/share/doc/"

}