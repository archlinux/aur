# It file is part of Security Hack Labs Team.
# Maintainer: Eduard Toloza <edu4rdshl@securityhacklabs.net>

pkgname='webhackshl'
pkgver=9.ef1f3fb
pkgrel=1
pkgdesc='Herramienta para hacking ético y auditorías en sitios web y servidores.'
arch=('any')
url='https://gitlab.com/sechacklabs/webhackshl'
license=('GPL')
depends=('nmap' 'fierce' 'sqlmap' 'dnsenum' 'nikto' 'whatweb' 'wpscan' 'ruby' 'git' 'curl' 'tor' 'gzip' 'john' 'python'  'python2-requests'  'python2-yaml'  'python2-flask')
makedepends=('git' 'ruby-bundler')
source=('git+https://gitlab.com/sechacklabs/webhackshl.git')
install='webhackshl.install'
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/webhackshl"

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/webhackshl"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/webhackshl"

  #make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/webhackshl/LICENSE"

  rm README.md LICENSE uninstall.sh update.sh install.sh

  cp -a * "$pkgdir/usr/share/webhackshl"

  cat > "$pkgdir/usr/bin/webhackshl" << EOF
#!/bin/sh
cd /usr/share/webhackshl
exec python webhackshl "\${@}"
EOF

  chmod a+x "$pkgdir/usr/bin/webhackshl"
}
