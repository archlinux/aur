# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=goenv
pkgver=3.1.0
pkgrel=1
pkgdesc="Like pyenv and rbenv, but for Go."

license=('MIT')
arch=('i686' 'x86_64')
url="https://github.com/go-nv/goenv"

depends=('bash' 'python' 'bats')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('8858af7b7d66ef3528d4a06db2dd90e5')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/lib/goenv"

  for dir in bin libexec plugins; do
    if [ -d "$dir" ]; then
      cp -dr --no-preserve=ownership "$dir" "${pkgdir}/usr/lib/goenv/"
    fi
  done

  rm -f "${pkgdir}/usr/lib/goenv/plugins/go-build/test/test_assert_helpers.bash"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/goenv/libexec/goenv" "${pkgdir}/usr/bin/goenv"

  echo "${pkgver}" > "${pkgdir}/usr/lib/goenv/APP_VERSION"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
