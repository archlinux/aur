# Maintainer: Kshitij Aucharmal <kshitijaucharmal21@gmail.com>

pkgname=geminishell
pkgver=1.0.0
pkgrel=1
pkgdesc="A shell program written in Python"
arch=('any')
url="https://github.com/kshitijaucharmal/geminishell"  # Replace with your project's URL
license=('Apache')
depends=('python' 'python-pip')  # Add other dependencies if needed
source=("git+https://github.com/kshitijaucharmal/$pkgname.git#branch=main")
sha256sums=('SKIP')  # Not required when using git

build() {
  cd "$srcdir/$pkgname"
  # Create virtual environment and install dependencies
  python -m venv env
  source env/bin/activate
  pip install -r requirements.txt
  pip install pyinstaller

  # Build the application
  pyinstaller src/__main__.py --clean -n geminishell --distpath target

  deactivate

  # Remove virtual environment
  rm -rf env
}

package() {
  cd "$srcdir/$pkgname"
  
  # Install the binary into /usr/bin
  install -Dm755 "target/geminishell/geminishell" "$pkgdir/usr/bin/geminishell"

  # Install the LICENSE file
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
