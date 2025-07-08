# Maintainer: Pedro Lucas <pedrolucasinvestidor62023@gmail.com>
pkgname=wine-manager
pkgver=1.0
pkgrel=1
pkgdesc="Um software que ajuda a gerenciar o wine"
arch=('any')
url="https://github.com/pedrodev2025/wine-manager"
license=('BSD3')
depends=('bash' 'wine' 'winetricks')
makedepends=('git') # Adicionado 'git' como makedepends para clonar o repositório

source=("git+${url}.git#tag=${pkgver}") # Usando git+URL e uma tag para controle de versão
# Se não houver tags, você pode usar:
# source=("git+${url}.git#branch=main") # Ou o nome da sua branch principal

sha256sums=('SKIP') # Use makepkg -g para gerar o sha256sum real após clonar o repositório

prepare() {
  # O repositório git é clonado automaticamente para $srcdir/wine-manager
  # Nenhuma ação de build complexa, então podemos preparar o arquivo aqui se necessário
  cd "$pkgname" # Entra no diretório clonado do projeto
  chmod +x wine-manager # Garante que o script seja executável
}

package() {
  # Copia o executável para o diretório de instalação padrão do Arch Linux
  install -D -m755 "$srcdir/$pkgname/wine-manager" "$pkgdir/usr/bin/wine-manager"
  # install -D -m755 cria os diretórios necessários e define permissões 755
}
