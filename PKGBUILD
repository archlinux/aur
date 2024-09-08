# Maintainer: Kshitij Aucharmal <kshitijaucharmal21@gmail.com>

pkgname=geminishell
pkgver=1.0.0
pkgrel=1
pkgdesc="A shell program written in Python"
arch=('any')
url="https://github.com/kshitijaucharmal/geminishell"  # Replace with your project's URL
license=('Apache')
depends=('python' 'pyinstaller' 'python-pip')  # Add other dependencies if needed
source=("git+https://github.com/kshitijaucharmal/$pkgname.git#branch=main")
sha256sums=('SKIP')  # Not required when using git

build() {
  cd "$srcdir/$pkgname"

  # Install dependencies and build using PyInstaller
  pip install -r requirements.txt
  pyinstaller src/__main__.py --clean -n geminishell --distpath target
}

package() {
  cd "$srcdir/$pkgname"
  
  # Install the binary into /usr/bin
  install -Dm755 "target/geminishell/geminishell" "$pkgdir/usr/bin/geminishell"

  # Install the LICENSE file
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
