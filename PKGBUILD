# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=jmt
pkgver=0.9.3
pkgrel=1
pkgdesc="Java Modelling Tools (JMT) is a comprehensive framework for performance evaluation, system modeling with analytical and simulation techniques, capacity planning and workload characterization studies."
arch=('any')
url="http://jmt.sourceforge.net/"
license=('GPL2')
depends=('java-environment>=8')
source=("jmt.jar::http://downloads.sourceforge.net/project/jmt/jmt/JMT-${pkgver}/JMT-singlejar-${pkgver}.jar"
        "jmt.desktop")
sha256sums=('8e8fbfcea7934da1608d1bcd1b3bf146e2793a0b4812887e7be4ef3bf92ac32b'
            '7f16e8dd880036a54e32cfc02213107c0efee1192bfb7ceddaa699b193490327')

package() {
  install -d -m755 $pkgdir/opt/$pkgname
  install -D -m644 $srcdir/jmt.jar $pkgdir/opt/$pkgname
  install -d -m755 $pkgdir/usr/bin

  cat << 'EOF' > $pkgdir/usr/bin/jmt
#!/bin/sh
"$JAVA_HOME/bin/java" -jar /opt/jmt/jmt.jar $@
EOF
  chmod 755 $pkgdir/usr/bin/jmt

  install -D -m644 $srcdir/jmt.desktop $pkgdir/usr/share/applications/jmt.desktop
}

# vim:set ts=2 sw=2 et:
