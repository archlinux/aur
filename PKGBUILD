# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
pkgname=mdsilo-bin
pkgver=0.5.10
pkgrel=1
pkgdesc="Lightweight Knowledge Base and Feed Reader."
arch=('x86_64')
url="https://mdsilo.com/"
_ghurl="https://github.com/mdSilo/mdSilo-app"
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libsoup'
)
source=(
  "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgname%-bin}-v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
)
sha256sums=('7e98bc0a12628b1ef20e42c78b7d2db22e0de73ebdbe7561a152d0295ea6e06f')
package() {
  install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/512x512"
  find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
  install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}