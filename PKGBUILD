# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Recolic K <root@recolic.net>

pkgname=microsoft-identity-broker-bin
_pkgname=microsoft-identity-broker
pkgver=2.0.1
pkgrel=3
pkgdesc="Broker for authentication between device and Microsoft Intune"
url="https://packages.microsoft.com/ubuntu/22.04/prod/pool/main/m/${_pkgname}"
license=("Unknown")
arch=("x86_64")
depends=("dbus" "gnome-keyring" "systemd" "jre11-openjdk")
provides=("msft-identity-broker=${pkgver}" "${_pkgname}")
conflicts=("msft-identity-broker" "${_pkgname}")
replaces=("msft-identity-broker" "${_pkgname}")
source_x86_64=("$url/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('bff171b5dbd16941d8aaf152909219ca270875ccb143c94fa58e6b6fdb269ea0')
install=${pkgname}.install

package() {
  cd "$srcdir"
  tar xvzf data.tar.gz
  echo ">>> Patching... (Hardcode archlinux java11 JAVA_HOME into xxx.service)"
  echo 'Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk"' >> "$srcdir/usr/lib/systemd/system/microsoft-identity-device-broker.service"
  echo 'Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk"' >> "$srcdir/usr/lib/systemd/user/${_pkgname}.service"
  cp -r "$srcdir/usr" "$srcdir/opt" "$pkgdir/"
}


