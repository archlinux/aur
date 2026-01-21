# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-denshi
_pkgname=seanime-denshi
pkgver=3.3.1
pkgrel=1
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration. (Denshi AppImage variant)"
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
depends=('fuse2' 'systemd')
conflicts=('seanime' 'seanime-bin')
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/${_pkgname}-${pkgver}_Linux_x86_64.AppImage")
sha256sums=('dec1463007b690208c43193e72f1ff09c20f31e65cb4be216883272eb0a67ad0')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -dm755 "${pkgdir}/opt/${pkgname}/${_pkgname}-${pkgver}_Linux_x86_64.AppImage"
  cp "${srcdir}/${_pkgname}-${pkgver}_Linux_x86_64.AppImage" "${pkgdir}/opt/${pkgname}/"
  chmod +x "${pkgdir}/opt/${pkgname}/${_pkgname}-${pkgver}_Linux_x86_64.AppImage"

  ln -sf "/opt/${pkgname}/${_pkgname}-${pkgver}_Linux_x86_64.AppImage" "${pkgdir}/usr/bin/${pkgname}"

  local user=${USER:-root}
  local group=${USER:-root}

  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" <<EOF
[Unit]
Description=Seanime Denshi Service
After=network.target

[Service]
ExecStart=/usr/bin/${pkgname}
Restart=always
User=$user
Group=$group

[Install]
WantedBy=multi-user.target
EOF
}
