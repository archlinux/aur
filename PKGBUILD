# Maintainer: Sergey Alexeyev s.n.alexeyev@gamil.com

author=s-n-alexeyev
pkgname=yvt
_gitname=yvt
pkgver=1.2.0.r1.g63aa5a7
pkgrel=1
pkgdesc='Yandex Video Translate. The script downloads videos from most popular video hosting platforms. It performs translation of video using Yandex neural network into one of the three available languages: Russian (by default), English, and Kazakh.'
arch=('any')
url='https://github.com/s-n-alexeyev/yvt'
license=('GPL3')
depends=('vot-cli' 'ffmpeg' 'yt-dlp' 'jq')
makedepends=('git')
provides=('yvt')
source=("git+https://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  (
    set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm 755 "$_gitname" "$pkgdir/usr/bin/$_gitname"
}
