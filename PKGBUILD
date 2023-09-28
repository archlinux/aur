# Maintainer: Sumith Emmadi <sumithemmadi244@gmail.com>

pkgname=beefproject
_pkgname=beef
pkgver=0.5.4.0
pkgrel=1
epoch=1
pkgdesc='The Browser Exploitation Framework that focuses on the web browser.'
arch=('any')
url='http://beefproject.com/'
install="$pkgname.install"
license=('Apache')
makedepends=('git')
depends=('ruby' 'ruby-bundler' 'sqlite' 'python' 'libxslt' 'nodejs' 'ruby-eventmachine')
conflicts=('beef' 'beef-git' 'beef-xss' 'beefproject-git')
source=("https://github.com/beefproject/beef/archive/refs/tags/v$pkgver.zip")
sha256sums=('6d48ab4b5200d41201ff1cb62f3306b70ea9a006b9e3e0dabe30a247dccb4686')

pkgver() {
  cd "$_pkgname-$pkgver"
  echo $pkgver
}

package() {
  cd "$_pkgname-$pkgver"

  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/opt/$pkgname"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md VERSION INSTALL.txt
  install -Dm 644 doc/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf doc README.md VERSION INSTALL.txt install

  cp -a * "$pkgdir/opt/$pkgname/"

  cat >"$pkgdir/usr/bin/$_pkgname" <<EOF
#!/bin/sh
cd /opt/$pkgname
exec ruby $_pkgname "\$@"
EOF

  chmod +x "$pkgdir/usr/bin/$_pkgname"
}
