# Maintainer: Joakim Reinert <mail+aur@jreinert.com>

pkgname=yanc-font-git
pkgver=1.0
pkgrel=1
pkgdesc='yet another neat condensed font. based on gohufont.'
arch=(any)
url='https://github.com/jreinert/yanc-font'
licence=('MIT')
depends=(fontconfig xorg-font-utils)
makedepends=('git' 'xorg-bdftopcf')

source=("${pkgname}::git+https://github.com/jreinert/yanc-font.git")
sha512sums=(SKIP)
provides=('yanc-font')
conflicts=('yanc-font')
install=$pkgname.install

pkgver() {
  cd "${pkgname}"
  printf '0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  for file in *.bdf; do
    bdftopcf $file | gzip > ${file/%bdf/pcf.gz}
  done
}

package() {
  cd "${pkgname}"
  install -d "$pkgdir/usr/share/fonts/misc"
  install -m644 *.pcf.gz "$pkgdir/usr/share/fonts/misc/"
}

# vim:set ts=2 sw=2 et:
