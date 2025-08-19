# Maintainer: Noble Eugene <nobleeugene2005@gmail.com>
pkgname="wff"
pkgver="0.1"
pkgrel=1
pkgdesc="Simple GUI screen recorder for wlroots compositors based on wl-recorder"
arch=("x86_64")
makedepends=("dotnet-sdk" "wayland-protocols" "zig-bin")
depends=("slurp" "wf-recorder" "ffmpeg" "wlr-randr" "dotnet-runtime")
url="https://www.github.com/eugenenoble2005/wff"
source=("git+https://github.com/eugenenoble2005/wff")
sha256sums=("SKIP")

build() {
	cd $srcdir/wff/Wff.Desktop
	dotnet publish --output dist
}

package() {
	cd $srcdir/wff/Wff.Desktop
	chmod +x ./dist/Wff.Desktop
	install -d -m 755 $pkgdir/usr/bin
    echo -e "#!/bin/bash\n exec /usr/lib/wff/Wff.Desktop \"\$@\"" > $pkgdir/usr/bin/wff
	chmod +x $pkgdir/usr/bin/wff
    install -d -m 755 $pkgdir/usr/lib/wff && cp -r dist/* $pkgdir/usr/lib/wff

    install -d -m 755 $pkgdir/usr/share/applications && cp ../wff.desktop $pkgdir/usr/share/applications
}
