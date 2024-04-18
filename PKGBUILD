# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname="autolinux-dmenu"
pkgver="0.2.0"
pkgrel=1
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(ttf-hack ttf-joypixels)
provides=(dmenu)
conflicts=(dmenu)
source=(
  "https://software.concise.cc/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  'd9b50ef6887b78656b35b1a4f1e8f1ebd9c4948ee189131d260ed73fe71882f8e222a842cffe176287e05d510c27ddc52798c636092d99d50ee558c893fcabea'
)
md5sums=(
  '949feb58f7eef3d7a7c28ca09350d750'
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
