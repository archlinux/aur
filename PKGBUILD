# Maintainer: tommis <tommi@saira.fi>

pkgname=dragit-git
_execname='dragit'
pkgver=r205.fcdd4ed
pkgrel=1
pkgdesc='Application for intuitive file sharing between devices.'
arch=('any')
conflicts=("dragit" "dragit-bin")
provides=("dragit")
depends=('gtk3')
makedepends=('cargo' 'git' 'rust')
url='https://github.com/sireliah/dragit'
license=('GPL3')
source=('git+https://github.com/sireliah/dragit.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_execname}"

  printf 'r%s.%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_execname}"

  cargo build --release
}

package() {
  cd "${_execname}"

  install -D -m 755               \
    "target/release/${_execname}" \
    "${pkgdir}/usr/bin/${_execname}"
  install -D -m 644 dragit.desktop \
		"${pkgdir}/usr/share/applications/dragit.desktop"
  install -D -m 644 static/logo_icon_t_256x256.png \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.sireliah.Dragit.png"
  install -D -m 644 \
    LICENSE         \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
