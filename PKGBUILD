# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>

pkgname=kzsh
pkgver=0.1.2
pkgrel=1
pkgdesc="Kuznix Shell (kzsh) — a bash-like shell written in C and C++"
arch=(any)
url="https://github.com/KuznixTeam/kzsh"
license=('GPL3')
depends=('glibc' 'readline')
makedepends=('meson' 'ninja' 'gcc' 'pkgconf')
conflicts=('kzsh-git' 'kzsh-bin')
source=("$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('64955528ae5a4c1cf4dd4e150840c862b0545e6dadb52a9b42d25eaa41a76159')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson setup build --prefix=/usr --buildtype=release
  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" meson install -C build
}
