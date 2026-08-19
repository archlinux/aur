# Maintainer: Jenrikku (JkKU)
pkgname=narc-cli
_reponame=NARC-CLI
pkgver=1.0.3
pkgrel=1
pkgdesc="A quick NARC cli app for reading, modifying and creating NARC files"
arch=('x86_64')
url="https://github.com/Jenrikku/NARC-CLI"
license=('BSD-3-Clause')
depends=('dotnet-runtime-10.0')
makedepends=('dotnet-sdk>=10.0')
optdepends=()
options=('!strip')
source=("$_reponame-$pkgver.tar.gz::https://github.com/Jenrikku/NARC-CLI/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4a1aab2612a2a9774e4f16977111799847a9ef5f778b9f8f0e679cdf5db8e2cd')

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
