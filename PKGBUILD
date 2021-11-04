# Maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=focalboard-bin
pkgver=v0.9.2
pkgrel=1
epoch=
pkgdesc="A self-hosted alternative to Trello, Notion, and Asana."
arch=(x86_64)
url="https://github.com/mattermost/focalboard"
license=('MIT')
groups=()
depends=(webkit2gtk)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mattermost/focalboard/releases/download/${pkgver}/focalboard-linux.tar.gz")
noextract=()
md5sums=('75a933c176cfeda8b642aef4c7f3b18c')
validpgpkeys=()

package() {
	cd focalboard-app
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/${pkgname}"

	# Copy data in /usr/share
	cp -r focalboard-app pack config.json "${pkgdir}/usr/share/${pkgname}/"

	# Create launcher in /usr/bin
	cat <<EOF > ${pkgdir}/usr/bin/${pkgname}
#!/bin/sh
cd /usr/share/${pkgname}
./focalboard-app \$@
EOF
	chmod +x ${pkgdir}/usr/bin/${pkgname}

	# Copy license
}
