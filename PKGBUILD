# Maintainer: Talha Asghar <iamtalhaasghar@gmail.com>
pkgname=browserselector
pkgver=1.0.3
pkgrel=2
pkgdesc="A script to select a browser based on user-defined rules"
arch=('any')
url="https://gitlab.com/iamtalhaasghar/browserselector"
license=('MIT')
depends=('python' 'python-pyxdg' 'python-pyqt6')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/iamtalhaasghar/browserselector/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP') # Replace 'SKIP' with the actual checksum after downloading the source

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # No compilation needed for this script
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Create the target directory for all files
  install -d "$pkgdir/usr/share/$pkgname"

  # Copy all Python files to the target directory
  install -Dm644 source/*.py "$pkgdir/usr/share/$pkgname/"

  # Make the entry point script executable
  chmod +x "$pkgdir/usr/share/$pkgname/browserSelector.py"

  # Copy config.json and urls.json to the target directory
  #install -Dm644 config.json "$pkgdir/usr/share/$pkgname/config.json"
  install -Dm644 source/urls.json "$pkgdir/usr/share/$pkgname/urls.json"

  # Create the /usr/bin directory
  install -d "$pkgdir/usr/bin"

  # Create a symlink for the entry point script in /usr/bin
  ln -s "/usr/share/$pkgname/browserSelector.py" "$pkgdir/usr/bin/browserselector"

  # Install the .desktop file to /usr/share/applications
  install -d "$pkgdir/usr/share/applications"
  install -Dm644 install/browserSelector.desktop "$pkgdir/usr/share/applications/browserSelector.desktop"

  # Update the Exec path in the .desktop file
  sed -i "s|^Exec=.*|Exec=/usr/bin/browserselector %U|" "$pkgdir/usr/share/applications/browserSelector.desktop"
}
