# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=omnisharp-roslyn-bin
pkgver=1.40.0
_dotnet_ver=10.0
pkgrel=1
pkgdesc='OmniSharp server (STDIO) based on Roslyn workspaces'
arch=(x86_64)
url='https://github.com/OmniSharp/omnisharp-roslyn'
license=(MIT)
depends=(dotnet-sdk-$_dotnet_ver)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source=(
	"omnisharp-linux-x64-net$_dotnet_ver-$pkgver.tar.gz::https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v$pkgver/omnisharp-linux-x64-net$_dotnet_ver.tar.gz"
)
sha256sums=('a5c68aed11a4f51c1e815cfc6dbefe30d7f302297b826370e32403546b57da65')
options=(!debug)

package() {
	install -Dm755 OmniSharp *.dll -t"$pkgdir"/usr/lib/omnisharp
	install -Dm644 *.json          -t"$pkgdir"/usr/lib/omnisharp
	install -dm755                   "$pkgdir"/usr/bin
	ln -s ../lib/omnisharp/OmniSharp "$pkgdir"/usr/bin/omnisharp
	install -Dm644 license.md        "$pkgdir"/usr/share/licenses/$pkgname/license.md
}
