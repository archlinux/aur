# Maintainer: Davi <davidev@snask.lang>
pkgname=snask
pkgver=0.4.1
pkgrel=1
pkgdesc="Snask Programming Language with Orchestrated Memory (OM) - Binary Release"
arch=('x86_64')
url="https://github.com/rancidavi-dotcom/TheSnask"
license=('MIT')
depends=('llvm18-libs' 'gtk3' 'zlib' 'sqlite' 'llvm18' 'clang18' 'lld18')
provides=('snask')
conflicts=('snask-git')
source_x86_64=(
  "snask-bin::${url}/releases/download/v${pkgver}/snask-linux-amd64"
  "snask-src.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums_x86_64=('162e2418c1411b5ca0b8b962fb7e5f8d0bed90e831144b275da08d443f00b16f'
                   '9bc1a5216fa804ddf66de7c42108d85c6b10b7963e8b091d898252ecb9fe8b11')

package() {
  # Instala o binário renomeado
  install -Dm755 "${srcdir}/snask-bin" "${pkgdir}/usr/bin/snask"

  # Pasta do código fonte extraído (nome do repo no zip)
  local src_dir="TheSnask-${pkgver/-beta/}"

  # Cria diretórios
  install -dm755 "${pkgdir}/usr/lib/snask/src"

  # Copia fonte
  cp -r "${src_dir}/src/"* "${pkgdir}/usr/lib/snask/src/"
}
