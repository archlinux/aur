# Maintainer: Glax its@glax.dev
pkgname=mica-bin
pkgver=1.0.0
pkgrel=5
pkgdesc="Use your Android phone as a microphone"
arch=('x86_64')
url="https://github.com/acaimingus/Mica"
license=('MIT')
source=("${pkgname}-${pkgver}_${pkgrel}::${url}/releases/download/${pkgver}/MicaListener-${pkgver}-amd64" # binary
	"MicaListener.desktop"
	"micalistener.service::${url}/raw/refs/heads/main/Packaging/Debian/usr/lib/systemd/user/micalistener.service" # systemd service
	"micalistener.install")
sha256sums=("53283c0e774af27681a88e23533226a2bed20d4932d31f06a8abdf01548c7c1a"
	"ccad0d61376365af60bd81ed1bd4d56c057d9959ffe341a98f7022990059048c"
	"6ead1a31b9183f1d41962e1ded5a54409dd2409ab4a21eff5a9d78eef82bd2bf"
	"f98a73249a1bbb34b9562e21d5fab2fd95cfbf41c470eed4e89abcacbdb812f9")
noextract=("${pkgname}-${pkgver}_${pkgrel}")
provides=("mica" "micalistener")
install="micalistener.install"
depends=("avahi" "pipewire")
optdepends=("systemd: Automatic service startup")

package() {
	# Copy files
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}_${pkgrel}" "${pkgdir}/usr/bin/MicaListener"

	# Add .desktop entry
	install -Dm644 "${srcdir}/MicaListener.desktop" "${pkgdir}/usr/share/applications/MicaListener.desktop"

	# Update .desktop entry
	# command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database || true

	# Install service
	install -Dm644 "${srcdir}/micalistener.service" "${pkgdir}/usr/lib/systemd/user/micalistener.service"
}
