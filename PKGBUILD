# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set the web view provider: either webkit, webengine, auto or none
_webview_provider=webkit

# set the JavaScript provider: either script, qml, auto or none
_js_provider=qml

_reponame=tageditor
pkgname=tageditor
pkgver=2.0.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A tag editor with Qt GUI and command-line interface supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus and Matroska'
license=('GPL')
depends=('qtutilities' 'tagparser' 'desktop-file-utils' 'xdg-utils')
[[ $_webview_provider == none ]] && [[ $_js_provider == none ]] && depends+=('qt5-base')
[[ $_webview_provider == webkit ]] && depends+=('qt5-webkit')
[[ $_webview_provider == webengine ]] && depends+=('qt5-webengine')
[[ $_js_provider == script ]] && depends+=('qt5-script')
[[ $_js_provider == qml ]] && depends+=('qt5-declarative')
makedepends=('cmake' 'qt5-tools')
url="https://github.com/Martchus/${_reponame}"
source=("${_reponame}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('b3818112660b14b5e50c2b2f9521a1aaa1dafc12145e340fc5b210ee36056e41')

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
