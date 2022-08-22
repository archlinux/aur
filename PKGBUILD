# Maintainer: yuioto <yuiotochan@outlook.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Shunsuke Shibayama <sbym1346@gmail.com>

pkgname='erg-git'
_pkgname="erg"
pkgver=0.2.7
pkgrel=1
pkgdesc="A statically typed language that can deeply improve the Python ecosystem"
url="https://github.com/erg-lang/erg"
license=('MIT' 'Apache')
arch=('x86_64')
conflicts=('erg-bin' 'erg')
depends=('python')
makedepends=('cargo' 'git')
source=("$_pkgname::git+https://github.com/erg-lang/erg.git")
sha256sums=("SKIP")

# By enabling the --features flag, you can change the language in which error messages are displayed.
# 
# Japanese
# cargo install erg --features japanese
#
# Chinese (Simplified)
# cargo install erg --features simplified_chinese
#
# Chinese (Traditional)
# cargo install erg --features traditional_chinese

build() {
	cd $_pkgname/
	cargo build --release --frozen
}

package() {
	install -Dm755 $_pkgname/target/release/$_pkgname -t "$pkgdir/usr/bin"
	install -Dm644 $_pkgname/LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 $_pkgname/README{,_zh-CN,_zh-TW,_JA}.md -t "$pkgdir/usr/share/doc/$pkgname"
}