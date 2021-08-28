# Maintainer: Jeromy Altuna <jaltuna at outlook dot es>

pkgname=refind-theme-nord
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple theme inspired to the nord palette"
arch=('any')
url="https://github.com/jaltuna/refind-theme-nord"
license=('MIT')
depends=('refind')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7dd33482adc9372fe10e4e549f48e9b31e934580ba29e88e20ab96de3374fb54')

install=$pkgname.install

prepare() {
  cd "$pkgname-$pkgver"
  # do not reset the STDIN file descriptor
  sed -e 's|exec|# exec|g' -i 'setup.sh'
}

package() {
  cd "$pkgname-$pkgver"
  _theme_dir="usr/share/refind/themes/nord"

  install -D -m0755 -t "${pkgdir}/${_theme_dir}/" "setup.sh"
  install -D -m0644 -t "${pkgdir}/${_theme_dir}/" {theme.conf,*.png}
  install -D -m0644 -t "${pkgdir}/${_theme_dir}/icons" "icons/"*.png

  # docs
  install -D -m0644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
  # licenses
  install -D -m0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" {LICENSE,COPYING}   
}
