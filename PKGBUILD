# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set the web view provider: either webkit, webengine or none
_webview_provider=webkit

# set the JavaScript provider: either script, qml or none
_js_provider=qml

_reponame=tageditor
pkgname=tageditor
pkgver=1.4.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A tag editor with Qt GUI and command-line interface supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus and Matroska."
license=('GPL')
depends=('qtutilities' 'tagparser' 'desktop-file-utils' 'xdg-utils')
[[ $_webview_provider == none ]] && [[ $_js_provider == none ]] && depends+=('qt5-base')
[[ $_webview_provider == webkit ]] && depends+=('qt5-webkit')
[[ $_webview_provider == webengine ]] && depends+=('qt5-webengine')
[[ $_js_provider == script ]] && depends+=('qt5-script')
[[ $_js_provider == qml ]] && depends+=('qt5-declarative')
makedepends=('cmake' 'qt5-tools')
install=${pkgname}.install
url="https://github.com/Martchus/${_reponame}"
source=("tageditor-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('37281b85c633b2f91310c0747f6ae69a108961ee5de1fa5ad3ba27a1707359aa')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DWEBVIEW_PROVIDER="${_webview_provider}" \
    -DJS_PROVIDER="${_js_provider}"
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
