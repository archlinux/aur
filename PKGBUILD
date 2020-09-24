# Maintainer: ValdikSS <iam@valdikss.org.ru>
# Contributor: Rein Fernhout <public@reinfernhout.xyz>

pkgname=imgur-screenshot-git
_pkgname=imgur-screenshot
pkgver=v2.0.0.r1.g0f53c6e
pkgrel=1
pkgdesc="Take screenshot selection, upload to imgur + more cool things"
arch=('any')
url="https://github.com/jomo/imgur-screenshot"
license=('MIT')
provides=('imgur-screenshot')
depends=('curl' 'grep' 'jq' 'scrot' 'xclip' 'libnotify')

source=('git+https://github.com/jomo/imgur-screenshot.git'
        'imgur-screenshot.desktop'
        'imgur-screenshot.png')
md5sums=('SKIP'
         '459431a977061e56894315ce151d9bef'
         '3780c9f2183f7d4705ab86ab077e3885')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm644 "$srcdir/imgur-screenshot.png" "$pkgdir/usr/share/pixmaps/imgur-screenshot.png"
  install -Dm644 "$srcdir/imgur-screenshot.desktop" "$pkgdir/usr/share/applications/imgur-screenshot.desktop"
  install -Dm755 imgur-screenshot "$pkgdir/usr/bin/imgur-screenshot"
}
