# Maintainer: Jiachen YANG <farseerfc@gmail.com>
# AUR Contributor: juantascon <juantascon.aur@horlux.org>
# AUR Contributor: Andrew Rembrandt <andrew@rembrandt.dev>
# Contributor : Jingbei Li <i@jingbei.li>

pkgname=plantuml-bin
_pkgname=plantuml
pkgver=1.2020.24
pkgrel=1
pkgdesc="Component that allows to quickly write uml diagrams"
arch=(any)
url="https://plantuml.com/"
license=('GPL')
depends=("java-runtime>=8" "bash")
makedepends=("apache-ant" "java-environment>=8")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://downloads.sourceforge.net/project/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.gz"
        "$_pkgname.run")
sha256sums=('c8e9ec32e95ad9edf15fae2e6f9850ebef11ba0aefbb5dd7a34002ffaccef2b3'
            'a3fb528f4c719cfd0ff6154c60fd54ce341011d132caf950cc30af4989f6aac8')
optdepends=('plantuml-ascii-math: allow use AsciiMath or JLaTeXMath notation'
            'ditaa: allow use ditaa notation'
            'graphviz: allow use Graphviz/DOT notation')

prepare(){
  cd "$srcdir/$_pkgname-$pkgver"
    sed 's/target="1.6"/target="1.7"/g' -i build.xml
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  # assume ant defaults to UTF8 encoding.
  ant dist
}

package() {
  depends+=("java-runtime")
  install -m 755 -D "$_pkgname.run" "$pkgdir/usr/bin/$_pkgname"

  cd "$srcdir/$_pkgname-$pkgver"
  install -m 644 -D "$_pkgname.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
}
