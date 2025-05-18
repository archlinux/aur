pkgname=goenv
pkgver=2.2.23
pkgrel=1
pkgdesc="Like pyenv and rbenv, but for Go."
arch=('i686' 'x86_64')
url="https://github.com/syndbg/goenv"
license=('MIT')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
	"go-build::https://github.com/go-nv/goenv/archive/master.tar.gz"
)
md5sums=('c6fb7e7187914544cb9b80eb3eb5c1f4'
         'dbe276a5fb75b204c0a6bc623b857413')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for file in libexec/*; do
    install -D -m755 "$file" "${pkgdir}/usr/lib/goenv/$file"
  done

  for file in bin/*; do
    install -D -m755 "$file" "${pkgdir}/usr/lib/goenv/$file"
  done

  install -d "${pkgdir}/usr/lib/goenv/plugins/go-build"
  cp -r "${srcdir}/goenv-master/plugins/go-build/"* "${pkgdir}/usr/lib/goenv/plugins/go-build/"


  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/goenv/libexec/goenv "${pkgdir}/usr/bin/goenv"

  echo "$pkgver" > "${pkgdir}/usr/lib/goenv/APP_VERSION"
}
