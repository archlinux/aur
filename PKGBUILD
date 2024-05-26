# Maintainer: yuhldr <yuhldr@gmail.com>
pkgname=lfy
pkgver=0.0.6
pkgrel=1
pkgdesc="翻译软件，使用adwaita和python原生开发，免费支持谷歌、必应、百度、腾讯翻译。A translation app by gtk4 and adwaita. Support Google, Bing, Baidu, Tencent Translate for free."
arch=('any')
url="https://github.com/ldrfy/lfy"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-requests')
makedepends=('git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=(${url}/archive/refs/tags/v${pkgver}.zip)
sha256sums=("6f0b7b6774324b9ba0e3cf2d2877d0210cc384e6f3d2fb7ce5fead30b30a43a6")


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
