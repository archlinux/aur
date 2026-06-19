pkgname=tb-nema-git
pkgver=v0.1.0
pkgrel=1
pkgdesc="TUI network manager with vim controls"
arch=('any')
url="https://github.com/nicitel3333/tb-nema"
license=('MIT')
depends=('python' 'python-textual' 'networkmanager')
makedepends=('git')
provides=('tb-nema')
conflicts=('tb-nema')
source=("git+https://github.com/nicitel3333/tb-nema.git")
sha256sums=('SKIP')

pkgver() {
  cd tb-nema
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "$pkgdir/usr/lib/tb-nema"
  install -d "$pkgdir/usr/lib/tb-nema/src"

  install -m 644 "$srcdir/tb-nema/main.py" "$pkgdir/usr/lib/tb-nema/"
  install -m 644 "$srcdir/tb-nema/src/"*.py "$pkgdir/usr/lib/tb-nema/src/"

  install -d "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/nema" <<'EOF'
#!/bin/bash
cd /usr/lib/tb-nema
exec python main.py "$@"
EOF
  chmod +x "$pkgdir/usr/bin/nema"
}
