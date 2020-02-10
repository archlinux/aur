# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=jmt
pkgver=1.0.4
pkgrel=1
pkgdesc="Java Modelling Tools (JMT) is a comprehensive framework for performance evaluation, system modeling with analytical and simulation techniques, capacity planning and workload characterization studies."
arch=('any')
url="http://jmt.sourceforge.net/"
license=('GPL2')
depends=('java-environment>=8')
source=("jmt.jar::http://downloads.sourceforge.net/project/jmt/jmt/JMT-${pkgver}/JMT-singlejar-${pkgver}.jar"
        "jmt.desktop")
sha256sums=('1ff6f790714b7cef721c590485c020fd889b7822130919c38480ad49687e6384'
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
