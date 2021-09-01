# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Evangelos Foutras <evangelos at foutrelis dot com>
# Contributor: Rttommy <rttommy at gmail dot com>

pkgname=xdotool-xwayland
pkgver=3.20210804.2
pkgrel=1
pkgdesc="Command-line X11 automation tool (actually tries to run if on xwayland)"
arch=('x86_64')
url="https://www.semicomplete.com/projects/xdotool/"
license=('BSD')
provides=(xdotool=$pkgver)
conflicts=(xdotool)
depends=('libxtst' 'libxinerama' 'libxkbcommon')
source=(https://github.com/jordansissel/xdotool/releases/download/v$pkgver/xdotool-$pkgver.tar.gz xdo-xwayland.patch no-post-install.patch)
sha256sums=('fde6b15b5978c91e0ecb78cc541a9987752e724820722e479dcc2efc17466c89'
            'bac917cabe9d4b95b03ecccafafc49da999e8c04588ec8fb2f9de5b8fbfd62fe'
            '656c4768d10073a56a5e76d529ee4c9d58db30e15aec6c3b1940fa8918792e76')

prepare() {
  cd xdotool-$pkgver
  patch -p1 < "$srcdir/xdo-xwayland.patch"
  patch -p1 < "$srcdir/no-post-install.patch"
}

build() {
  cd xdotool-$pkgver
  make WITHOUT_RPATH_FIX=1
}

package() {
  cd xdotool-$pkgver
  make PREFIX="$pkgdir/usr" INSTALLMAN="$pkgdir/usr/share/man" install
  install -Dm644 COPYRIGHT -t "$pkgdir/usr/share/licenses/xdotool"
}

# vim:set ts=2 sw=2 et:
