# It file is part of Security Hack Labs Team.
# Maintainer: Eduard Toloza <edu4rdshl@securityhacklabs.net>

pkgname='webhackshl'
pkgver=10.1d9afd5
pkgrel=1
pkgdesc='Herramienta para hacking ético y auditorías en sitios web y servidores.'
arch=('any')
url='https://gitlab.com/sechacklabs/webhackshl'
license=('GPL')
depends=('nmap' 'fierce' 'sqlmap' 'dnsenum' 'nikto' 'whatweb' 'wpscan' 'ruby' 'git' 'curl' 'tor' 'gzip' 'john' 'python'  'python2-requests'  'python2-yaml'  'python2-flask' 'ruby-bundler')
makedepends=('git')
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

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/webhackshl/LICENSE"

  cp -a * "$pkgdir/usr/share/webhackshl"

  cat > "$pkgdir/usr/bin/webhackshl" << EOF
#!/bin/sh
cd /usr/share/webhackshl
exec python webhackshl "\$@"
EOF

  chmod a+x "$pkgdir/usr/bin/webhackshl"
}
