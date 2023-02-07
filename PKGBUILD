# Maintainer: éclairevoyant
# Contributor: Klaus Alexander Seistrup <klaus at seistrup dot dk>

pkgname='nimdow'
pkgver=0.7.35
pkgrel=4
pkgdesc='Tiling window manager written in Nim'
arch=('x86_64')
url="https://github.com/avahe-kellenberger/$pkgname"
license=('GPL2')
depends=('glibc')
makedepends=('git' 'nim')
_commit=b3097e94093d8c37b5331addbf3b248e194981c1
source=("git+$url.git#commit=$_commit"
        "0001-use-full-URLs-in-nimble-file.patch")
b2sums=('SKIP'
        '9a2ab646e40b29ea44ea68c4a4b3242b982703835acfff2712ba80d8aaa92c179fa9649a8b798cae2b296857e36385b742e99e13638074dc279b3593e7fb02ad')

prepare() {
	cd $pkgname
	patch -Np1 -i ../0001-use-full-URLs-in-nimble-file.patch
	nimble install --reject --depsOnly --nimbleDir:../nimble/
}

build() {
	cd $pkgname
	nimble release --nimbleDir:../nimble/
}

package() {
	cd $pkgname
	install -Dm0755 bin/$pkgname        -t "$pkgdir/usr/bin/"
	install -Dm0644 doc/$pkgname.1      -t "$pkgdir/usr/share/man/man1/"
	install -Dm0644 config.default.toml -t "$pkgdir/usr/share/$pkgname/"
	install -Dm0644 $pkgname.desktop    -t "$pkgdir/usr/share/xsessions/"
	install -Dm0644 README.md           -t "$pkgdir/usr/share/doc/$pkgname/"
}
