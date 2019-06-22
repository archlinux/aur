# Maintainer: Vianney le Clément de Saint-Marcq <code@quartic.eu>
pkgname=git-publish
pkgver=1.5.0
pkgrel=1
pkgdesc="Prepare and store patch revisions as git tags"
arch=('any')
url="https://github.com/stefanha/git-publish"
license=('MIT')
depends=('python' 'git')
makedepends=('perl')
source=("https://github.com/stefanha/git-publish/archive/v${pkgver}.tar.gz")
sha256sums=('f33c687b1472ba1405087124df00bc228e892d9c561b3b57d33553aeb72c3687')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  pod2man -c "Git Manual" -r "git-publish ${pkgver}" git-publish.pod > git-publish.1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 git-publish "${pkgdir}/usr/bin/git-publish"

  install -Dm644 git-publish.1 "${pkgdir}/usr/share/man/man1/git-publish.1"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r hooks "${pkgdir}/usr/share/doc/${pkgname}/hooks"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
