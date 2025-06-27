# Maintainer: PS2Comrade <your-email@example.com>

pkgname=microfetch
pkgver=0.5.2
pkgrel=2
pkgdesc="A minimal and fast system information fetching tool written in Python"
arch=('any')
url="https://github.com/VeryEpicKebap/microfetch"
license=('GPL')
depends=('python')
source=("git+https://github.com/VeryEpicKebap/microfetch.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  
  # Create necessary directories
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/etc/microfetch"
  
  # Install the main script as executable
  install -Dm755 src/microfetch.py "$pkgdir/usr/bin/microfetch"
  
  # Install the config file
  install -Dm644 src/config.ini "$pkgdir/etc/microfetch/config.ini"
  
  # Modify the script to look for config.ini in the system location
  sed -i "s|config.read('config.ini')|config.read(['./config.ini', os.path.expanduser('~/.config/microfetch/config.ini'), '/etc/microfetch/config.ini'])|" "$pkgdir/usr/bin/microfetch"
  
  # Install license if it exists
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  
  # Install documentation if it exists
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
