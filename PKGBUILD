# Maintainer: David Barnett <zyphrus@outlook.com>
pkgname='whiley'
pkgver='0.3.40'
pkgrel='1'
pkgdesc='Whiley Development Kit. A programming language particularly suited to safety-critical systems'
arch=("any")
url="http://whiley.org/"
license=('BSD License')
depends=('java-environment-jdk')
provides=('whiley')
source=("http://whiley.org/download/wdk/wdk-src-v${pkgver}.tgz")
sha256sums=('f2fd28773a05ced31624baee3fcb3d27e5353c1ceb3e6288962aefebc5a05da7')

build() {
  cd "${srcdir}"
  echo "#!/bin/bash" > proxy
  echo "sh /usr/share/$pkgname/bin/\$(basename \$0) \$@" >> proxy
}

package() {
  cd "${srcdir}/wdk-v${pkgver}"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r * "$pkgdir/usr/share/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd ${srcdir}
  for bin in $(ls "${srcdir}/wdk-v${pkgver}/bin"); do
    install -Dm755 proxy "$pkgdir/usr/bin/${bin}"
  done
}

# vim:set ts=2 sw=2 et:
