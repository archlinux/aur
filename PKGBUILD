pkgname=spigot
pkgver=1.8.7
pkgrel=1
pkgdesc="High performance Minecraft server implementation"
arch=(any)
url="http://www.spigotmc.org/"
license=("LGPL")
depends=(java-runtime-headless tmux sudo fontconfig)
makedepends=(java-environment git)
conflicts=(bukkit craftbukkit spigot-patcher)
provides=(bukkit "craftbukkit=${pkgver%_*}")
install=spigot.install
source=("https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
"spigot.service"
"spigot.sh")
noextract=("BuildTools.jar")
md5sums=('SKIP'
         '55eb03d443e1aa1a013aa01798e056d4'
         '8933d1710304dfdf99632f53551672ef')
build() {
	export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=1g"
	java -jar BuildTools.jar --rev $pkgver
}
package() {
  install -Dm644 spigot-$pkgver.jar "$pkgdir/srv/craftbukkit/spigot.jar"
  install -m755 spigot.sh "$pkgdir/srv/craftbukkit/spigot.sh"
  install -Dm644 spigot.service "$pkgdir/usr/lib/systemd/system/spigot.service"
}

# vim:set ts=2 sw=2 et:
