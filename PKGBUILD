# Maintainer: Varun M <varunushamurali@gmail.com>

pkgname=mybatop
pkgver=1.0.1
pkgrel=1
pkgdesc="mybatop continuously monitors laptop battery status and provides detailed analytics through HTML reports."
arch=('any')
url="https://github.com/vishnumur777/mybatop"
license=('GPL-3.0')
depends=('bash' 'systemd' 'dmidecode' 'python' 'python-pandas' 'python-plotly')
source=("https://github.com/vishnumur777/mybatop/releases/download/1.0.1/mybatop-1.0.1.tar.gz")
sha256sums=('SKIP')
install=mybatop.install

package() {
  mkdir -p "$pkgdir/opt/mybatop"
  mkdir -p "$pkgdir/etc/systemd/system"
  mkdir -p "$pkgdir/usr/bin"

  echo "Source directory: $srcdir"
  echo "Package directory: $pkgdir"
  pwd
  ls
  # Copy source files from $srcdir to /opt/mybatop
  cp -r "$srcdir/mybatop-1.0.1/"* "$pkgdir/opt/mybatop/"

  # Install systemd service files (adjust path if needed)
  cp "$srcdir/mybatop-1.0.1/filesystemd"/mybatop-* "$pkgdir/etc/systemd/system/"

  # Create symlink to the installed script
  ln -s "/opt/mybatop/scripts/runscript/mybatop" "$pkgdir/usr/bin/mybatop"

  # Set permissions
  chmod -R 755 "$pkgdir/opt/mybatop"

  # Set ownership
  chown -R $USER:$USER "$pkgdir/opt/mybatop"
}
