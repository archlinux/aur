# Maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=focalboard-bin
pkgver=v0.10.0
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
sha256sums=('6d6422ccddd55dda40690acd2b70b5b82afef0a3d132c89f0804fb4ab3ffae2d')
validpgpkeys=()

package() {
	cd focalboard-app
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/${pkgname}"

	# Copy data in /usr/share
	cp -r focalboard-app pack config.json "${pkgdir}/usr/share/${pkgname}/"

	# Create launcher in /usr/bin
	cat <<EOF > ${pkgdir}/usr/bin/${pkgname}
#!/bin/sh
origin_share=/usr/share/${pkgname}
share=\${HOME}/.local/share/${pkgname}
[[ -d \${share} ]] || mkdir -p \${share}
cd \${share}
[[ -f config.json ]] || cp \${origin_share}/config.json .
[[ -e pack ]] || ln -s \${origin_share}/pack
[[ -e focalboard-app ]] || ln -s \${origin_share}/focalboard-app
./focalboard-app \$@
EOF
	chmod +x ${pkgdir}/usr/bin/${pkgname}

}
