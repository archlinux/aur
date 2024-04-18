# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname="autolinux-dmenu"
pkgdesc="The AutoLinux fork of dmenu"
pkgver=0.2.2
pkgrel=1
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(ttf-hack)
provides=(dmenu)
conflicts=(dmenu)
replaces=(dmenu)
source=(
  "https://gitlab.com/a4to/autolinux-dmenu/-/archive/archive-0.2.2/autolinux-dmenu-archive-0.2.2.tar.gz"
)
sha512sums=(
  '37c07b17015a1ad9f06236cdc15eab2f943487ac2d6ab582f17fed98b1d76396a701d7b0e078f6b55f1b3f99ec13ac48e8cca50914ea8d3704b6f866d56684d7'
)
md5sums=(
  'a3854928dfb048c61bf56e69ff650a00'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

#pkgver() {
#	cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" >/dev/null 2>&1 ||
#  cd "$srcdir/${pkgname}"
#  printf "0.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
  cd "$srcdir/autolinux-dmenu-archive-0.2.2"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/autolinux-dmenu-archive-0.2.2"

  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
