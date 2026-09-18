# Maintainer: cN3rd <cN3rd@users.noreply.github.com>

pkgname=unity-cli-bin
pkgver=1.0.0beta.10
_pkgver=1.0.0-beta.10
pkgrel=1
pkgdesc='Standalone Unity CLI for installing editors, adding modules and managing projects'
arch=('x86_64' 'aarch64')
url='https://docs.unity.com/en-us/hub/use-unity-cli'
license=('LicenseRef-Unity')
depends=('glibc' 'gcc-libs')
provides=("unity-cli=$pkgver")
conflicts=('unity-cli')
options=('!strip')
install="$pkgname.install"
_url="https://public-cdn.cloud.unity3d.com/hub/prod/cli/$_pkgver"
source=('LICENSE')
source_x86_64=("$pkgname-$pkgver-x86_64::$_url/unity-linux-x64")
source_aarch64=("$pkgname-$pkgver-aarch64::$_url/unity-linux-arm64")
sha256sums=('a1cd22f2ed49a674f6d2c324e1a3f1abbf9c0607b83939c56ceddf32bbe9bac1')
sha256sums_x86_64=('10a5146400c092da0678327e167edc7f7dbb354f1b3fd76a5535990dee125da7')
sha256sums_aarch64=('eba806368ab70772cff8a9a62c839fa109f19d902659613f33e5ea903c1bf62f')
noextract=("$pkgname-$pkgver-$CARCH")

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/unity"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	local _unity="$pkgdir/usr/bin/unity"
	"$_unity" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/unity"
	"$_unity" completion zsh  | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_unity"
	"$_unity" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/unity.fish"
}
