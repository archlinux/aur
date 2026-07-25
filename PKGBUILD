# Maintainer: gambarim <gambarim@pm.me>

pkgname=buzz-bin
pkgver=0.4.25
pkgrel=1
pkgdesc='A workspace where humans and agents build together, on a relay you own'
arch=('x86_64')
url='https://buzz.xyz'
license=('Apache')
depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
  'zlib'
)
provides=('buzz')
conflicts=('buzz')
source=("https://github.com/block/buzz/releases/download/v${pkgver}/Buzz_${pkgver}_amd64.deb")
sha256sums=('5b2eb26e75dc1be20154e044a268f71c0ceed7a560a032a73f976ed43d6cfe87')

pkgver() {
  curl -sL "https://api.github.com/repos/block/buzz/releases/latest" |
    python -c "import sys,json; print(json.load(sys.stdin)['tag_name'].lstrip('v'))"
}

package() {
  cd "${srcdir}"
  ar x "Buzz_${pkgver}_amd64.deb"
  tar xf data.tar.* -C "${pkgdir}"
}
