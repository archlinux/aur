# Maintainer: MrGilfy <MrGilfy@users.noreply.github.com>

pkgname=appimg-bin
_pkgname=appimg
pkgver=0.4.1
pkgrel=1
pkgdesc="Install, update and remove AppImages as proper desktop applications (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/MrGilfy/appimg"
license=('MIT')
options=('!debug' '!strip')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
optdepends=('fuse2: needed by most AppImages at runtime'
            'squashfs-tools: read AppImage metadata without running it'
            'desktop-file-utils: desktop database updates'
            'gtk-update-icon-cache: icon cache updates')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/appimg-$pkgver-x86_64-linux-musl.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/appimg-$pkgver-aarch64-linux-musl.tar.gz")
sha256sums_x86_64=('23d355f689439cad0c7ad9dcedcc49883c8ce1b86f3a6528370c69b206641294')
sha256sums_aarch64=('95acc2591fea0ae6581f4051805778b7566c62c736b117db1eedbc1b780694a7')

package() {
	cd "appimg-$pkgver-$CARCH-linux-musl"

	install -Dm0755 -t "$pkgdir/usr/bin/" appimg
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" man/appimg.1
	install -Dm0644 completions/appimg.fish \
		"$pkgdir/usr/share/fish/vendor_completions.d/appimg.fish"
	install -Dm0644 completions/appimg.bash \
		"$pkgdir/usr/share/bash-completion/completions/appimg"
	install -Dm0644 completions/_appimg \
		"$pkgdir/usr/share/zsh/site-functions/_appimg"
}
