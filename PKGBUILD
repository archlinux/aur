# Maintainer: RadiantCorium

pkgname=openlwr-bin
pkgver=alpha2025223
pkgrel=1
arch=('x86_64'  'aarch64')
pkgdesc="An open-source multiplayer simulation of a boiling water reactor in development"
url="https://github.com/OpenLWR/OpenLWR"
license=('AGPL-3.0')

source_x86_64=("https://github.com/OpenLWR/OpenLWR/releases/download/$pkgver/Linux-x64")
source_aarch64=("https://github.com/OpenLWR/OpenLWR/releases/download/$pkgver/Linux-arm64")

sha256sums_x86_64=("16a825e7e98189cb3545fdbd99ee099d36c14371013e03797e4e2bad130993fb")
sha256sums_aarch64=("594f267e4b081e344680f0cf58201687d2d022596508b07e67150ba7b376fff4")

package() {
	local binary

	case "$CARCH" in
		x86_64)
			binary="Linux-x64"
			;;
		aarch64)
			binary="Linux-arm64"
			;;
		*)
			echo "Unsupported Architecture: $CARCH"
			exit 1
			;;
	esac

	install -Dm755 "$srcdir/${binary}" "$pkgdir/usr/bin/openlwr"

	mkdir -p "$pkgdir/usr/share/applications"
	cat <<EOF > "$pkgdir/usr/share/applications/openlwr.desktop"
[Desktop Entry]
Type=Application
Name=OpenLWR
Exec=/usr/bin/openlwr
Categories=Game
Terminal=false
EOF
}
