# Maintainer: Simon Hauser <Simon-Hauser@outlook.de>

pkgname=vscode-json-languageserver
pkgver=1.3.1
pkgrel=1
pkgdesc="The JSON Language server provides language-specific smarts for editing, validating and understanding JSON documents."
arch=('any')
url="https://github.com/vscode-langservers/vscode-json-languageserver"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=(vscode-json-languageserver)
conflicts=(vscode-json-languageserver-bin)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
md5sums=('48e7bb6a9aac50b9cf23bf9d6d514788')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
