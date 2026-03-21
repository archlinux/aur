# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
pkgname=gram-editor-bin
pkgver=1.1.0
pkgrel=2
pkgdesc="A code editor for humanoid apes and grumpy toads"

provides=(gram-editor gram)
conflicts=(gram-editor gram)

arch=('x86_64')

url="https://codeberg.org/GramEditor/gram"
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)

depends=('alsa-lib'
		'fontconfig'
		'gcc-libs'
		'glibc'
		'libxcb'
		'libxkbcommon'
		'libxkbcommon-x11'
		'openssl'
		'sqlite'
		'vulkan-driver'
		'vulkan-icd-loader'
		'vulkan-tools'
		'wayland'
		'zlib')

optdepends=(
	'rustup: permits installing rust-based extensions'
	'clang: improved C/C++ language support'
	'eslint: improved Javascript language support'
	'pyright: improved Python language support'
	'rust-analyzer: improved Rust language support'
)

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/gram-linux-x86_64-${pkgver}.tar.gz")
sha256sums=('9c7044dcee65cca6fb7ceadd4dbfe779f8afb9731c8a8056d3a3600f76736aca')

package() {
	cd "gram.app"
	
	install -Dm0755 bin/gram "$pkgdir/usr/bin/gram"
	install -Dm0755 libexec/gram-editor "$pkgdir/usr/lib/gram/gram-editor"
	install -Dm0644 share/applications/gram.desktop "$pkgdir/usr/share/applications/se.ziran.Gram.desktop"

	mkdir -p "$pkgdir/usr/share/icons/"

	cp -r share/icons "$pkgdir/usr/share/icons/"

	chmod -R 755 "$pkgdir/usr/share/icons/"
}

