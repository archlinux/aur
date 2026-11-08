# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=hyprlayout
pkgver=1.1.1
pkgrel=1
pkgdesc="LÖVE GUI to configure monitor layouts on wayland (hyprland, umbriel, etc)"
arch=(any)
url="https://github.com/fdev31/hyprlayout"
license=('MIT')
depends=('love')
optdepends=('grim: live screen preview')
makedepends=('zip')
source=("https://github.com/fdev31/hyprlayout/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('80ffdbd9526af5a0f1d69073c41ba3bd')

build() {
	cd "${srcdir}/hyprlayout-${pkgver}/src"
	zip -qr ../hyprlayout.love .
}

package() {
	cd "${srcdir}/hyprlayout-${pkgver}"

	install -Dm644 hyprlayout.love "${pkgdir}/usr/share/hyprlayout/hyprlayout.love"

	sed 's|^Exec=.*|Exec=hyprlayout|' hyprlayout.desktop > hyprlayout-app.desktop
	install -Dm644 hyprlayout-app.desktop "${pkgdir}/usr/share/applications/hyprlayout.desktop"

	cat > hyprlayout-bin <<'EOF'
#!/bin/sh
exec love /usr/share/hyprlayout/hyprlayout.love "$@"
EOF
	install -Dm755 hyprlayout-bin "${pkgdir}/usr/bin/hyprlayout"
}
