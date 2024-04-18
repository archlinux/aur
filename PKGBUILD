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
  '1cd4453a8e54e3da6eed704c5e6191c9a8c4eb6a530c78983d1dba813ba2db33c1c09dcbb67be124573456e62ead63e6843a7376632cd432bb8a98ddcddcf64d'
)
md5sums=(
  '0e1422f2076d2dedd9a911161b8c3ccc'
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
  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" >/dev/null 2>&1 ||
  cd "$srcdir/${pkgname}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" >/dev/null 2>&1 ||
  cd "$srcdir/${pkgname}"

  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
