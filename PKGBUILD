# Maintainer: MrGilfy <MrGilfy@users.noreply.github.com>

pkgname=appimg-bin
_pkgname=appimg
pkgver=0.2.0
pkgrel=1
pkgdesc="Install, update and remove AppImages as proper desktop applications (prebuilt binary)"
arch=('x86_64')
url="https://github.com/MrGilfy/appimg"
license=('MIT')
options=('!debug' '!strip')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
optdepends=('fuse2: needed by most AppImages at runtime'
            'appimageupdatetool: delta updates via zsync'
            'desktop-file-utils: desktop database updates'
            'gtk-update-icon-cache: icon cache updates')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/appimg-$pkgver-$CARCH-linux-musl.tar.gz")
sha256sums=('fe7658c0c0c8f51490fc997c1bafb9e225836373bc60cf2633275740ab453fac')

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
