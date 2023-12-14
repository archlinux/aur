# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# based on aur electron21-bin: Yurii Kolesnykov <root@yurikoles.com>
_pkgname=electron2
pkgname="${_pkgname}-bin"
_major=2
_subver="0.18"
_pkgver="${_major}.${_subver}"
pkgver="${_pkgver/-/.}"
pkgrel=2
pkgdesc="Build cross platform desktop apps with web technologies - Binary version ${_major}"
arch=(
	'x86_64'
	'aarch64'
)
url="https://electronjs.org/"
_releaseurl="https://github.com/${_projectname}/${_projectname}/releases/download/v${_pkgver}"
license=(
	'MIT'
	'custom'
)
depends=(
	'alsa-lib'
	'gtk3'
	'libxss'
	'nss'
	'gconf'
	'libxcursor'
	'libcups'
	'libxrandr'
	'pango'
	'expat'
	'gdk-pixbuf2'
	'at-spi2-core'
	'libxcomposite'
	'libxdamage'
	'libxext'
	'libx11'
	'libxfixes'
	'libxtst'
	'cairo'
	'libxcb'
	'nspr'
	'libxrender'
	'fontconfig'
	'libxi'
)
optdepends=(
	'kde-cli-tools: file deletion support (kioclient5)'
	'libappindicator-gtk3: StatusNotifierItem support'
	'pipewire: WebRTC desktop sharing under Wayland'
	'qt5-base: enable Qt5 with --enable-features=AllowQt'
	'trash-cli: file deletion support (trash-put)'
	'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
noextract=(
	"${pkgname}-chromedriver-${pkgver}-${CARCH}.zip"
	"${pkgname}-${pkgver}-${CARCH}.zip"
)
source_x86_64=(
	"${pkgname}-chromedriver-${pkgver}-x86_64.zip::${_releaseurl}/chromedriver-v${_pkgver}-linux-x64.zip"
	"${pkgname}-${pkgver}-x86_64.zip::${_releaseurl}/${_projectname}-v${_pkgver}-linux-x64.zip"
)
source_aarch64=(
	"${pkgname}-chromedriver-${pkgver}-aarch64.zip::${_releaseurl}/chromedriver-v${_pkgver}-linux-arm64.zip"
	"${pkgname}-${pkgver}-aarch64.zip::${_releaseurl}/${_projectname}-v${_pkgver}-linux-arm64.zip"
)
sha256sums_x86_64=('37140f6ec7d333dcd559c85815d547ef7a0046272f37fce0f78c308032779edc'
                   'f196e06b6ecfa33bffb02b3d6c4a64bd5a076014e2f21c4a67356474ee014000')
sha256sums_aarch64=('516981ca6f7465dba55228df9ba30b7e0566a3eec694e5a2cc2fbe58a41ff006'
                    'dfcfb60fc57dcec41a25cebbea37c0486a0ffd690ac3ccbb80a97161851df81f')
build() {
	install -Dm755 -d "${srcdir}/${pkgname%-bin}"
	bsdtar -xf "${srcdir}/${pkgname}-chromedriver-${pkgver}-${CARCH}.zip" -C "${srcdir}/${pkgname%-bin}"
	bsdtar -xf "${pkgname}-${pkgver}-${CARCH}.zip" -C "${srcdir}/${pkgname%-bin}"
}
package() {
	install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
	cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/lib"
	ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%2-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}