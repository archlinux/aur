# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname="autolinux-dmenu"
pkgdesc="The AutoLinux fork of dmenu"
pkgver="0.2"
pkgrel=1
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(ttf-hack)
provides=(dmenu)
conflicts=(dmenu)
replaces=(dmenu)
source=(
  "https://software.concise.cc/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  'e25f96483ff8ebf6c233b6a2f5dbba9cc522ec4e3fa99f51893d8a76c763dda388949719513eb6cdb8ee3c405aebc304b34c6d48bbd27a46dfb89a811336b43a'
)
md5sums=(
  'a3ec7b8c24c44603c4b31b150be09fb9'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

pkgver() {
	cd "${_pkgname}"
  printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
