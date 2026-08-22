# Maintainer: Jenrikku (JkKU)
pkgname=narc-cli
_reponame=NARC-CLI
pkgver=1.1.0
pkgrel=1
pkgdesc="A quick NARC cli app for reading, modifying and creating NARC files"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Jenrikku/NARC-CLI"
license=('BSD-3-Clause')
depends=('dotnet-runtime-10.0')
makedepends=('dotnet-sdk>=10.0')
optdepends=()
options=('!strip')
source=("$_reponame-$pkgver.tar.gz::https://github.com/Jenrikku/NARC-CLI/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0ae95342cd0177c2a364ff020d228b5eff4330434cfb625d5092436629ba918f')

build() {
	cd "$_reponame-$pkgver"
	dotnet publish -c Release -r linux-x64
}

package() {
	install -dm755 "$pkgdir/usr/share/narc-cli"
	install -dm755 "$pkgdir/usr/bin"

	cp -r "$_reponame-$pkgver/$_reponame/bin/Release/net10.0/linux-x64/publish/"* "$pkgdir/usr/share/narc-cli"
	rm "$pkgdir/usr/share/narc-cli/"*.pdb
	chmod 755 "$pkgdir/usr/share/narc-cli/narc"

	ln -s "/usr/share/narc-cli/narc" "$pkgdir/usr/bin/narc"
}
