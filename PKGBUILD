# Maintainer: Adam Asaad <adam.asaad76@@gmail.com>
pkgname=maelstrom-jepsen
pkgver=0.2.3
pkgrel=1
pkgdesc="A workbench for writing toy implementations of distributed systems."
arch=("x86_64")
url="https://github.com/jepsen-io/maelstrom"
license=('EPL')
depends=("jdk-openjdk")
optdepends=("gnuplot: generate plots of throughput and latency"
            "graphviz: generate plots of consistency anomalies")
sha1sums=('SKIP')
source=("https://github.com/jepsen-io/maelstrom/releases/download/v$pkgver/maelstrom.tar.bz2")

package() {
  echo "#!/bin/sh" >> maelstrom-script
  echo 'exec java -Djava.awt.headless=true -jar "/usr/share/java/maelstrom-jepsen.jar" "$@"' >> maelstrom-script
  chmod +x maelstrom-script

  install -Dm755 "./maelstrom-script" "$pkgdir/usr/bin/maelstrom"
  install -Dm755 "$srcdir/maelstrom/lib/maelstrom.jar" "$pkgdir/usr/share/java/maelstrom-jepsen.jar"
}
