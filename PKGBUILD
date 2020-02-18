# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs-vault-bin
pkgver=2.12.0c
pkgrel=2
pkgdesc="Integrates the Vault Web-Interface into bitwarden_rs. Pre-compiled binaries from https://github.com/dani-garcia/bw_web_builds."
arch=('any')
url="https://github.com/bitwarden/web"
license=('AGPL3')
depends=('bitwarden_rs')
conflicts=("bitwarden_rs-vault-git" "bitwarden_rs-vault") 
provides=('bitwarden_rs-vault')
install=bitwarden_rs-vault-bin.install
source=("bw_web_build.tgz::https://github.com/dani-garcia/bw_web_builds/releases/download/v$pkgver/bw_web_v$pkgver.tar.gz"
	"$pkgname.install")
noextract=("bw_web_build.tgz")
sha512sums=('0ef28a072d28a0c48edba277d65bf3c28d2b1944ac380b4edeae27a812270f27add479892dac08351c76fa63861b8020ed90d7f9c20f2fe3a406d7c482e23345'
            '5265612afd40cb757e7d6550ca902f9c02c558e7d03607a181df923374efdf9eff85296c216db7c96d9987eb1fe0834a7eb90de7dcd988c9f7443dc69b9469b1')
# We'll have to extract manually because otherwise it would extract directly into $srcdir.
prepare() {
	cd "$srcdir"
	mkdir vault
	tar -xf bw_web_build.tgz -C vault
}

package() {
	# install vault files
	install -d "$pkgdir/usr/share/bitwarden_rs"
	cp -r "$srcdir/vault" "$pkgdir/usr/share/bitwarden_rs/vault"
}
