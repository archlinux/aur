# Maintainer: Josehpequeno <hicarojbs21@gmail.com>
pkgname=cutieascii                    # Nome do pacote no repositório
pkgver=0.1.0                         # Versão do SOFTWARE
pkgrel=1                             # Versão do PACOTE (incrementa em mudanças de empacotamento)
pkgdesc="Display random cute ASCII art emojis"  # Descrição que aparece no gerenciador
arch=('x86_64')                      # Arquitetura: x86_64 (64-bit), any (qualquer)
url="https://github.com/Josehpequeno/cutieascii"  # URL do projeto
license=('MIT')                      # Licença: MIT, GPL, Apache, etc.
makedepends=('go')                   # Dependências de COMPILAÇÃO (removidas após instalação)
depends=('glibc')
ource=("$pkgname-$pkgver.tar.gz::https://github.com/Josehpequeno/cutieascii/archive/v$pkgver.tar.gz")

# Arquivo fonte que será baixado (normalmente do GitHub Releases)
source=("$pkgname-$pkgver.tar.gz")

# Checksum para verificar integridade (SKIP = pular verificação)
sha256sums=('SKIP')

# Função build(): compila o software
build() {  
  # Compila o programa Go
  # -o cutieascii: nome do binário de saída
  # .: compila o pacote no diretório atual
  export CGO_ENABLED=0
  go build -trimpath -ldflags="-s -w" -o cutieascii .
}

# Função package(): instala os arquivos no sistema
package() {
  # Instala o binário executável
  # -Dm755: cria diretórios, modo 755 (rwxr-xr-x)
  # $pkgdir: diretório raiz fictício onde o pacote é montado
  install -Dm755 cutieascii "$pkgdir/usr/bin/cutieascii"
  
  # Instala os arquivos de dados (emojis)
  # -Dm644: cria diretórios, modo 644 (rw-r--r--)
  # -t: especifica o diretório destino
  install -Dm644 -t "$pkgdir/usr/share/cutieascii/kaoscii/" kaoscii/*
}