pkgname=goenv
pkgver=2.2.33
pkgrel=1
pkgdesc="Like pyenv and rbenv, but for Go."
arch=('i686' 'x86_64')
url="https://github.com/syndbg/goenv"
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "go-build-${pkgver}.tar.gz::https://github.com/go-nv/goenv/archive/refs/tags/${pkgver}.tar.gz"
)
md5sums=('ae714f64ce82e7e45cb2f53fb80809d5'
         'ae714f64ce82e7e45cb2f53fb80809d5')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for file in libexec/*; do
    install -D -m755 "$file" "${pkgdir}/usr/lib/goenv/$file"
  done

  for file in bin/*; do
    install -D -m755 "$file" "${pkgdir}/usr/lib/goenv/$file"
  done

  install -d "${pkgdir}/usr/lib/goenv/plugins/go-build"
  if [ -d "${srcdir}/goenv-${pkgver}/plugins/go-build" ]; then
    cp -r "${srcdir}/goenv-${pkgver}/plugins/go-build/"* "${pkgdir}/usr/lib/goenv/plugins/go-build/"
  fi

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/goenv/libexec/goenv "${pkgdir}/usr/bin/goenv"

  echo "$pkgver" > "${pkgdir}/usr/lib/goenv/APP_VERSION"
}
