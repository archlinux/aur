# Maintainer: Pedro Lucas <pedrolucasinvestidor62023@gmail.com>
pkgname=navegadorpytech
pkgver=0.0.1
pkgrel=2
pkgdesc="Um Navegador simples,seguro,leve e privado usando python e desenvolvido usando 100% tecnologias de codigo aberto!"
arch=('any')
url="https://github.com/pedrodev2025/Navegador-B-sico-E-Leve-Com-Python-.git"
license=('GPL3')
install="$pkgname.install"
depends=('python3' 'python-pip' 'base')
makedepends=()
# ADICIONE AQUI os arquivos do ícone e do desktop à lista de sources.
# Eles estarão no mesmo diretório do PKGBUILD.
source=(
  "0.0.1.tar.gz::https://github.com/pedrodev2025/Navegador-B-sico-E-Leve-Com-Python-/archive/refs/tags/0.0.1.tar.gz"
  "navegadorpytechicon.png::https://github.com/pedrodev2025/Navegador-B-sico-E-Leve-Com-Python-/releases/download/0.0.1/navegadorpytechicon.png"       # Adicionado!
  "navegadorpytechdesktop.desktop" # Adicionado!
)
# Atualize o sha256sums para incluir os novos arquivos (por enquanto, 'SKIP')
sha256sums=('fa30878df649617873dfa568657905d32cf802663e0bbd32289591a8b9e2074c'
            'b1c86afae39358e3299ca6ed5d456d0cb5f90407cc26d7beda20506bb5d67af0'
            'a84cfe4290cae99589f1d8bc7c10de91f691a6f2d7c406ad657b6059435816e9')

build() {
  echo "Não tem build, ignore essa mensagem"
}

package() {
  set -ex # Mantenha o debug

  mkdir -p "$pkgdir/opt/navegadorpytech/venv" # O venv será criado aqui pelo post_install

  # O navegador.py vai para /opt/navegadorpytech/
  install -Dm755 "$srcdir/Navegador-B-sico-E-Leve-Com-Python--0.0.1/navegador.py" "$pkgdir/opt/navegadorpytech/navegador.py"

  # Ícone e Desktop File
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
  install -Dm644 "$srcdir/navegadorpytechicon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/navegadorpytechicon.png"

  mkdir -p "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/navegadorpytechdesktop.desktop" "$pkgdir/usr/share/applications/navegadorpytechdesktop.desktop"

  # Script Wrapper em /usr/bin - VAI APONTAR PARA A PASTA CORRETA /opt/navegadorpytech/
  mkdir -p "$pkgdir/usr/bin/"
  cat > "$pkgdir/usr/bin/navegadorpytech" << 'EOF'
#!/bin/bash
/opt/navegadorpytech/venv/bin/python /opt/navegadorpytech/navegador.py "$@" # <-- AQUI A CORREÇÃO FINAL DOS CAMINHOS
EOF
  chmod +x "$pkgdir/usr/bin/navegadorpytech"
}
