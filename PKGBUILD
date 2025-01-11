# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=clipit
pkgname=${_pkgname}-git
pkgver=0.259.f35db54
pkgrel=1
pkgdesc="Lightweight GTK+ clipboard manager"
url="https://github.com/CristianHenzel/ClipIt"
license=('GPL3')
arch=('x86_64')
conflicts=("${_pkgname}")
makedepends=('intltool')
depends=('gtk3' 'libappindicator-gtk3')
optdepends=('xdotool: for automatic paste')
source=(
  "${_pkgname}::git+${url}.git"
  fix-casts.patch
)
sha256sums=(
  'SKIP'
  '91879dcbdf2dfa0f9a3c718c05b79834abcc1669d4a59d3801b7d09185873e06'
)

pkgver () {
  cd "${srcdir}/${_pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

prepare() {
  patch -p0 < fix-casts.patch
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --with-gtk3
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}

[[ "$PACKAGER" != *"[p]" ]] && PACKAGER+=" [p]" || true

[[ "$PACKAGER" != *"[p]" ]] && PACKAGER+=" [p]" || true
