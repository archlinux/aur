# Maintainer: Samantha Baldwin <fuhsaz+aur 'at' cryptic 'dot' li>
# Contributor: Paul Nicholson <brenix@gmail.com>
# Contributor: Francesco Piccinno <stack.box@gmail.com>

pkgname='brutessh'
pkgver='0.6'
pkgrel=6
pkgdesc="A simple multithreaded sshd password bruteforcer using a wordlist."
url='http://www.edge-security.com/edge-soft.php'
license=('GPL')
arch=('any')
depends=('python2' 'python2-paramiko')
source=("http://www.edge-security.com/soft/brutessh-${pkgver}.tar")
sha1sums=('6cae74213abc22535511c0b103bcd70587b99339')

package() {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/$pkgname"

  install -Dm644 -t "$pkgdir/usr/share/$pkgname" *.py
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
python2 /usr/share/$pkgname/brutessh.py "\$@"
EOF

  chmod +x "$pkgdir/usr/bin/$pkgname"
}
