# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=lexical-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Lexical is a next-generation elixir language server"
arch=('x86_64')
url="https://github.com/lexical-lsp/lexical"
options=("!strip")
license=('Apache-2.0')
depends=('elixir')
source=(
  "https://github.com/lexical-lsp/lexical/releases/download/v${pkgver}/lexical-v${pkgver}.zip"
  "find_lexical_dir_even_if_link.patch"
  "silence_which.patch"
  )
sha256sums=('17aef3289bbf10d025283eff0fb351ecac7b2e17b51bb92f7e799cbec9e932a3'
            'b8b74b3135f8afc1f925f207ff570e5c21cb659678d544c10205f1a11539baf2'
            '4297bf826bb0193c62ee2a4e9d46d53d6858b3a83d083521d3c77eef9fa3c8a7')

package() {
  mkdir -p ${pkgdir}/usr/lib ${pkgdir}/usr/bin
  cp -rd ${srcdir}/lexical ${pkgdir}/usr/lib/lexical
  cd ${pkgdir}/usr/lib/lexical/bin
  cat ${srcdir}/find_lexical_dir_even_if_link.patch | patch -p0
  cat ${srcdir}/silence_which.patch | patch -p0
  cd ${pkgdir}/usr/bin
  ln -s ../lib/lexical/bin/start_lexical.sh lexical
}
