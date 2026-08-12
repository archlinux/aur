# Maintainer: Your Name <your.email@example.com>
# Upstream: https://github.com/alexballas/go2tv

pkgname=go2tv-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Cast media files to Smart TVs and Chromecast devices (pre-built binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/alexballas/go2tv"
license=('MIT')
depends=()
optdepends=('ffmpeg: transcoding support')
provides=("go2tv=${pkgver}")
conflicts=('go2tv')

# 上游发布使用 v 前缀的 tag，如 v2.4.0
_upstream_repo="alexballas/go2tv"
_upstream_tag="v${pkgver}"

# 架构无关的公共资源（从上游源码仓库获取）
source=(
  "LICENSE::https://raw.githubusercontent.com/${_upstream_repo}/${_upstream_tag}/LICENSE"
  "app.go2tv.go2tv.desktop::https://raw.githubusercontent.com/${_upstream_repo}/${_upstream_tag}/assets/linux/app.go2tv.go2tv.desktop"
  "app.go2tv.go2tv.appdata.xml::https://raw.githubusercontent.com/${_upstream_repo}/${_upstream_tag}/assets/linux/app.go2tv.go2tv.appdata.xml"
  "go2tv-icon-desktop-512.png::https://raw.githubusercontent.com/${_upstream_repo}/${_upstream_tag}/assets/go2tv-icon-desktop-512.png"
  "go2tv-icon-color.svg::https://raw.githubusercontent.com/${_upstream_repo}/${_upstream_tag}/assets/go2tv-icon-color.svg"
)

# 架构相关：预编译二进制
source_x86_64=("go2tv-${pkgver}-amd64.zip::https://github.com/${_upstream_repo}/releases/download/${_upstream_tag}/go2tv_${_upstream_tag}_linux_amd64.zip")
source_aarch64=("go2tv-${pkgver}-arm64.zip::https://github.com/${_upstream_repo}/releases/download/${_upstream_tag}/go2tv_${_upstream_tag}_linux_arm64.zip")
source_armv7h=("go2tv-${pkgver}-arm.zip::https://github.com/${_upstream_repo}/releases/download/${_upstream_tag}/go2tv_${_upstream_tag}_linux_arm.zip")

sha256sums=('f3e74b19ba21d7c94eb917b4a9027e069de8350629d25a14e95161c4f6e6fe51'
            'cb4563f5856fac6b51f4c8b08e25520501bd7cca0dab48606025f350cdf1cc9a'
            '01670f59e37ac96851661aa35c39e9bdfd0fbdcdafb54be5f56c322f5e0610f1'
            '06ddd76db63dc6733dd12b3645fe817bb9e8c659cec6f1756031bcf91d459f23'
            'd1825ec83521c2e46399955cd42813a3df2051b856c6296cf122dc435d9ed570')
sha256sums_x86_64=('b02c22ebc3f4f42e6f2c29bf4793fcf0e06a0f213644768fba9b595b98da53ef')
sha256sums_aarch64=('7f4a6d1b4f4407b3e37d9d574cd8348a67c2f7111958092c7a2a957dece83d3c')
sha256sums_armv7h=('e9f7e570d5a1fbf020d4419f46d893f9c212027dcd1eaae116cf0d26fa060670')

package() {
    install -Dm755 "go2tv" -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "app.go2tv.go2tv.desktop" "${pkgdir}/usr/share/applications/app.go2tv.go2tv.desktop"
    install -Dm644 "app.go2tv.go2tv.appdata.xml" "${pkgdir}/usr/share/metainfo/app.go2tv.go2tv.appdata.xml"
    install -Dm644 "go2tv-icon-desktop-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/app.go2tv.go2tv.png"
    install -Dm644 "go2tv-icon-color.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/app.go2tv.go2tv.svg"
}
