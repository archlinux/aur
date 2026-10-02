# Maintainer: MrGilfy <MrGilfy@users.noreply.github.com>

pkgname=appimg-bin
_pkgname=appimg
pkgver=0.3.0
pkgrel=1
pkgdesc="Install, update and remove AppImages as proper desktop applications (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/MrGilfy/appimg"
license=('MIT')
options=('!debug' '!strip')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
optdepends=('fuse2: needed by most AppImages at runtime'
            'appimageupdatetool: delta updates via zsync'
            'desktop-file-utils: desktop database updates'
            'gtk-update-icon-cache: icon cache updates')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/appimg-$pkgver-x86_64-linux-musl.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/appimg-$pkgver-aarch64-linux-musl.tar.gz")
sha256sums_x86_64=('804dd1170eadebeb6b380a05325034a1ff1e035de8a2160cebbcf80318c42293')
sha256sums_aarch64=('c0982408fd1c67eb3d128d3741bde2a04749d72aa4a3cf974946d80f5b7e3803')

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
