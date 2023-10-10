# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Recolic K <root@recolic.net>

pkgname=microsoft-identity-broker
pkgver=1.5.1
pkgrel=1
pkgdesc="microsoft-identity-broker"
url="https://packages.microsoft.com/ubuntu/20.04/prod/pool/main/m/microsoft-identity-broker"
license=("GPL2")
arch=("x86_64")
depends=("dbus" "gnome-keyring" "systemd" "jre11-openjdk")
provides=("msft-identity-broker=${pkgver}")
conflicts=("msft-identity-broker")
replaces=("msft-identity-broker")
source=("source.deb::$url/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('2438b186365c527f546c59e0e3a5c660c431739a12026ad89c2e0acad56ce443')
install=x.install

package() {
  cd "$srcdir"
  ar x source.deb
  tar xvzf data.tar.gz
  echo ">>> Patching... (Hardcode archlinux java11 JAVA_HOME into xxx.service)"
  echo 'Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk"' >> "$srcdir/usr/lib/systemd/system/microsoft-identity-device-broker.service"
  echo 'Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk"' >> "$srcdir/usr/lib/systemd/user/microsoft-identity-broker.service"
  cp -r "$srcdir/usr" "$srcdir/opt" "$pkgdir/"
}


