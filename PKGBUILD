# Maintainer: Davi <davidev@snask.lang>
pkgname=snask
pkgver=0.4.1
pkgrel=1
pkgdesc="Snask Programming Language with Orchestrated Memory (OM) - Binary Release"
arch=('x86_64')
url="https://github.com/rancidavi-dotcom/TheSnask"
license=('MIT')
depends=('llvm18-libs' 'gtk3' 'zlib' 'sqlite')
provides=('snask')
conflicts=('snask-git')
source_x86_64=(
  "${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/snask-linux-amd64"
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums_x86_64=('20a7dac42c7e8f47d53ac889a41c80398b4ae9b979015c2a9389526a9c3262de'
                   '088c85f3d7c5d213c065c5dd54400c4e4ee7329a44f8c9e56a8f5f0f8a0f9a35')

package() {
  # Instala o binário
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/snask"
  
  # Pasta do código fonte extraído
  local src_dir="TheSnask-${pkgver}"

  # Cria diretórios de biblioteca
  install -dm755 "${pkgdir}/usr/lib/snask/runtime"
  install -dm755 "${pkgdir}/usr/lib/snask/stdlib"

  # Copia stdlib e runtime do código fonte
  cp -r "${src_dir}/src/runtime/"* "${pkgdir}/usr/lib/snask/runtime/"
  cp -r "${src_dir}/src/stdlib/"* "${pkgdir}/usr/lib/snask/stdlib/"
  cp "${src_dir}/src/runtime.c" "${pkgdir}/usr/lib/snask/runtime/"

  # O usuário ainda precisará rodar 'snask setup' para gerar os .o e .bc
  # ou podemos automatizar isso no post-install se necessário.
}
