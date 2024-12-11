# Maintainer: yuhldr <yuhldr@gmail.com>
pkgname=lfy
pkgver=0.1.0
pkgrel=1
pkgdesc="翻译软件，使用adwaita和python原生开发，免费支持谷歌、必应、百度、腾讯翻译。A translation app by gtk4 and adwaita. Support Google, Bing, Baidu, Tencent Translate for free."
arch=('any')
url="https://github.com/ldrfy/lfy"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-requests')
makedepends=('git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=(${url}/archive/refs/tags/v${pkgver}.zip)
sha256sums=("84502281e709662b28a6561284059d7700b94ade5554facf36cfb049bc1749f3")


build() {
    cd ${pkgname}-${pkgver}
    meson _build --prefix="/usr"
	meson compile -C _build
}

check() {
  cd ${pkgname}-${pkgver}
  meson test -C _build --print-errorlogs
}

package() {
  cd ${pkgname}-${pkgver}
  meson install -C _build --destdir "$pkgdir"
}
