# Maintainer: Francisco Brito <francisco.brito.developer@gmail.com>
pkgname=wizardjs-appimage
pkgver=1.0.0
pkgrel=1
pkgdesc="WizardJS - JavaScript & TypeScript playground (AppImage build)"
arch=('x86_64')
url="https://github.com/modalesxd/WizardJS"
license=('MIT')
depends=('nodejs' 'git')
makedepends=('git')
source=()
noextract=()

build() {
  cd "$srcdir"
  git clone https://github.com/modalesxd/WizardJS.git
  cd WizardJS

  # Instalar dependencias de npm localmente
  npm install

  # Construir y hacer make
  npm run make
}

package() {
  cd "$srcdir/WizardJS/out/make/AppImage/x64"

  APPIMAGE=$(ls *.AppImage | head -n1)
  if [[ -z "$APPIMAGE" ]]; then
    echo "No se encontró AppImage en $(pwd)"
    return 1
  fi

  install -Dm755 "$APPIMAGE" "$pkgdir/usr/bin/wizardjs"
}

