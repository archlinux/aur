# Maintainer: Hexa Programmer <your-email-here>
pkgname=hexatyping-git
_pkgname=hexatyping
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimalist, terminal-based typing tester (TUI) with 5 technical modes."
arch=('any')
url="https://github.com/YourUsername/hexatyping"
license=('MIT')
depends=('python')
makedepends=('git')
provides=('hexatyping')
conflicts=('hexatyping')
# This pulls your code directly from your GitHub repo
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"

  # 1. Create the system directory for your app data
  install -d "$pkgdir/usr/share/hexatyping"
  
  # 2. Install the python script and ALL your .txt files
  # This matches the 'paths' logic we put in your Python code!
  install -m644 hexatyping.py "$pkgdir/usr/share/hexatyping/hexatyping.py"
  install -m644 *.txt "$pkgdir/usr/share/hexatyping/"

  # 3. Create the 'hexatyping' command in /usr/bin so users can just type the name
  install -d "$pkgdir/usr/bin"
  echo "#!/bin/sh" > "$pkgdir/usr/bin/hexatyping"
  echo "python3 /usr/share/hexatyping/hexatyping.py \"\$@\"" >> "$pkgdir/usr/bin/hexatyping"
  
  # 4. Give the command execution permissions
  chmod +x "$pkgdir/usr/bin/hexatyping"
  
  # 5. Install the License file (Arch requirement)
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}