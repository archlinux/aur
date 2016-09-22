# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: nmeum <nmeum-aur@8pit.net>

pkgname=tpm
pkgver=1.3.2
pkgrel=1
pkgdesc='tiny password manager'
url='http://github.com/nmeum/tpm'
license=('GPL')
arch=('any')
depends=('gnupg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nmeum/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9ea145e7f731c50ba3a8dfa252c7d0b31cd5b12b03db33dd95d7d8ebb53d4e6b')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -Dm644 contrib/zsh_completion "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 contrib/bash_completion "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}
