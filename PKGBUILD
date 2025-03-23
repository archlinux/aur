# Maintainer: wtolley <william@breakpointingbad.com>
pkgname=wpm
pkgver=1.0.1
pkgrel=1
pkgdesc="A lightweight waypoint manager for saving and navigating directories"
arch=('any')
url="https://github.com/wtolley/wpm"
license=('WTFPL')
source=("https://github.com/wtolley/wpm/releases/download/${pkgver}/wpm-${pkgver}.tar.gz")
sha256sums=('SKIP')  # You can replace 'SKIP' with the actual sha256 checksum

build() {
  cd "${pkgname}-${pkgver}"
  echo "Compiling wpm..."
  gcc -o wpm wpm.c || return 1
}

package() {
  cd "${pkgname}-${pkgver}"
  # Install the compiled executable to /usr/local/bin
  install -Dm755 wpm "$pkgdir"/usr/local/bin/wpm
  
  # Install the shell wrapper script to /etc/profile.d
  install -Dm755 wpm.sh "$pkgdir"/etc/profile.d/wpm.sh
  
  # (Optional) Install the install script for reference/documentation
  install -Dm644 wpm_install.sh "$pkgdir"/usr/share/wpm/wpm_install.sh
  
  # Install the README and LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/wpm/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/wpm/LICENSE
}
