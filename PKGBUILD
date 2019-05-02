# Maintainer: Tinu Weber <https://gnugen.ch/~mtweber>

pkgname=epfl-scripts-git
pkgver=r68.86eb50d
pkgrel=1
arch=(any)

pkgdesc="Collection of scripts for simplifying one's life at EPFL"
url='https://gitlab.gnugen.ch/gnugen/epfl-scripts'
license=(Apache)

provides=(epfl-scripts)
conflicts=(epfl-scripts)

depends=(coreutils)
optdepends=('iproute2: network-namespaces in epfl-vpn'
            'iptables: network-namespaces in epfl-vpn')

source=('git+https://gitlab.gnugen.ch/gnugen/epfl-scripts.git')
md5sums=(SKIP)

pkgver() {
  cd epfl-scripts
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  depends+=(curl bash file openconnect perl-file-mimeinfo perl-html-tree
            perl-io-stringy perl-lwp-protocol-https perl-html-treebuilder-xpath
            perl-www-mechanize perl-xml-xpathengine sh)

  install -Dm755 -t "$pkgdir"/usr/bin epfl-scripts/bin/*
}
