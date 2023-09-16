# Maintainer: Sumith Emmadi <sumithemmadi244@gmail.com>

pkgname=beef-xss
_pkgname=beef
pkgver=4197.1f5b6b0t
pkgrel=1
epoch=1
pkgdesc='The Browser Exploitation Framework that focuses on the web browser.'
arch=('any')
url='http://beefproject.com/'
install="$_pkgname.install"
license=('Apache')
makedepends=('git')
depends=('ruby' 'ruby-bundler' 'sqlite' 'python' 'libxslt' 'nodejs' 'ruby-eventmachine')
conflicts=('beef' 'beef-git')
source=("git+http://github.com/beefproject/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_pkgname

  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$pkgname"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md VERSION INSTALL.txt
  install -Dm 644 doc/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf doc README.md VERSION INSTALL.txt install

  cp -a * "$pkgdir/usr/share/$pkgname/"

  cat >"$pkgdir/usr/bin/$_pkgname" <<EOF
#!/bin/sh
cd /usr/share/$pkgname
exec ruby $_pkgname "\$@"
EOF

  chmod +x "$pkgdir/usr/bin/$_pkgname"
}
