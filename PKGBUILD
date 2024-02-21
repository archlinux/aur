# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=upd8all
pkgver=0.0.4
pkgrel=1
pkgdesc="Upd8All: Simplify package updates on Arch Linux with one command. Supports Pacman, Yay, and Homebrew."
arch=('x86_64')
url="https://github.com/felipealfonsog/Upd8All"
license=('BSD 3-Clause')
depends=('python')

source=("https://github.com/felipealfonsog/Upd8All/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('96346ebe8e3474bc3b390d43ffe5cabed9d098e19bd1d719fdc3e7adb326d0e9')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

package() {
  # Instalar el script Python
  install -Dm755 "$srcdir"/Upd8All-v."${pkgver}"/src/upd8all_updater.py "${pkgdir}/usr/local/bin/upd8all.py"
  
  # Crear un script shell para ejecutar upd8all.py y copiarlo a /usr/local/bin
  echo '#!/bin/bash' > upd8all
  echo 'python /usr/local/bin/upd8all.py "$@"' >> upd8all
  chmod +x upd8all
  install -Dm755 upd8all "${pkgdir}/usr/local/bin/upd8all"
}

