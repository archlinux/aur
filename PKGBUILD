# Maintainer: necklace <ns@nsz.no>
# Contributor:  Vincent Grande (shoober420) <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_gitname="harfbuzz"
pkgver=2.9.1
pkgname=("harfbuzz-bin-${pkgver}")
pkgrel=2
pkgdesc="HarfBuzz text shaping engine"
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"
arch=(x86_64)
license=(MIT)
provides=('harfbuzz-2.9.1')
depends=("chafa")
makedepends=(glib2 freetype2 graphite cairo icu gobject-introspection gtk-doc
             ragel git python meson chafa gcc pkg-config)
source=("https://github.com/${_gitname}/${_gitname}/releases/download/${pkgver}/${_gitname}-${pkgver}.tar.xz")
sha256sums=('0edcc980f526a338452180e701d6aba6323aef457b6686976a7d17ccbddc51cf')

build() {
  cd "${_gitname}-${pkgver}"
  ./configure --prefix=/usr
  make
}


package() {
  mkdir -p "${pkgdir}/usr/lib/"
  install -Dm755 "${srcdir}/${_gitname}-${pkgver}/src/.libs/libharfbuzz.so" "${pkgdir}/usr/lib/libharfbuzz.so.0.20901.0"
  install -Dm755 "${srcdir}/${_gitname}-${pkgver}/src/.libs/libharfbuzz-subset.so" "${pkgdir}/usr/lib/libharfbuzz-subset.so.0.20901.0"
}

