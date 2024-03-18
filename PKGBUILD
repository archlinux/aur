# Maintainer: Noa <coolreader18@gmail.com>
pkgname=celeste64-bin
pkgver=1.1.1
pkgrel=2
pkgdesc="A game made in under 2 weeks for Celeste's 6th Anniversary (official bin)"
arch=(x86_64 aarch64)
url="https://maddymakesgamesinc.itch.io/celeste64"
license=('custom:celeste64')
options=('!strip' '!debug')
provides=(celeste64)
conflicts=(celeste64)
source_x86_64=(Celeste64-$pkgver-x86_64.zip::"https://github.com/ExOK/Celeste64/releases/download/v$pkgver/Celeste64-v$pkgver-Linux-x64.zip")
source_aarch64=(Celeste64-$pkgver-aarch64.zip::"https://github.com/ExOK/Celeste64/releases/download/v$pkgver/Celeste64-v$pkgver-Linux-arm64.zip")
source=("https://github.com/ExOK/Celeste64/raw/v$pkgver/ReadMe.md"
	SourceLicense.txt::"https://github.com/ExOK/Celeste64/raw/v$pkgver/Source/License.txt"
        "celeste64.desktop")
noextract=("Celeste64-$pkgver-"{x86_64,aarch64}".zip")
sha256sums_x86_64=('56720256950cdeba9bb6eef9bdd3abdb85362c1ab949b8b183ad88c5db416cad')
sha256sums_aarch64=('b871fd37759e2ab1187b78fa93e99407c69c72949e21993447068017f09c002d')
sha256sums=('e553c30d574acd1a7f768f3e952fb167e4a05fcfa824bdccf1888a39e21f3069'
            '45aa2d76c41f60e8062b2c4a8f1014ed8a2601ca51432bd9436e58bc8fa0f640'
            '9906284626f846e34c55807a60126b2bf034697adab5ef15c2665e18f5abd795')

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir"/opt/celeste64
	bsdtar -xC "$pkgdir"/opt/celeste64 -f "Celeste64-$pkgver-$CARCH.zip"
	install -Dm 644 celeste64.desktop -t "$pkgdir"/usr/share/applications
	awk '/License/{license=1} license{print}' ReadMe.md >License.txt
	install -Dm 644 License.txt -t "$pkgdir"/usr/share/licenses/celeste64
	install -Dm 644 SourceLicense.txt -t "$pkgdir"/usr/share/licenses/celeste64
}
