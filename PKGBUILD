# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Recolic K <root@recolic.net>

pkgname=microsoft-identity-broker-bin
_pkgname=microsoft-identity-broker
pkgver=2.0.1
pkgrel=2
pkgdesc="Broker for authentication between device and Microsoft Intune"
url="https://packages.microsoft.com/ubuntu/20.04/prod/pool/main/m/${_pkgname}"
license=("Unknown")
arch=("x86_64")
depends=("dbus" "gnome-keyring" "systemd" "jre11-openjdk")
provides=("msft-identity-broker=${pkgver}" "${_pkgname}")
conflicts=("msft-identity-broker" "${_pkgname}")
replaces=("msft-identity-broker" "${_pkgname}")
source_x86_64=("$url/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('7ed7cb4bc6c984161a4fb489d764ea0dafb2c4a0499d3c0c5a0b3e5f115bb02b')
install=${pkgname}.install

package() {
  cd "$srcdir"
  tar xvzf data.tar.gz
  echo ">>> Patching... (Hardcode archlinux java11 JAVA_HOME into xxx.service)"
  echo 'Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk"' >> "$srcdir/usr/lib/systemd/system/microsoft-identity-device-broker.service"
  echo 'Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk"' >> "$srcdir/usr/lib/systemd/user/${_pkgname}.service"
  cp -r "$srcdir/usr" "$srcdir/opt" "$pkgdir/"
}


