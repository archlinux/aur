# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Recolic K <root@recolic.net>

pkgname=microsoft-identity-broker-bin
_pkgname=microsoft-identity-broker
pkgver=1.6.1
pkgrel=1
pkgdesc="Broker for authentication between device and Microsoft Intune"
url="https://packages.microsoft.com/ubuntu/20.04/prod/pool/main/m/${_pkgname}"
license=("Unknown")
arch=("x86_64")
depends=("dbus" "gnome-keyring" "systemd" "jre11-openjdk")
provides=("msft-identity-broker=${pkgver}" "${_pkgname}")
conflicts=("msft-identity-broker" "${_pkgname}")
replaces=("msft-identity-broker" "${_pkgname}")
source_x86_64=("$url/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('0accbbc7086ad733257ccf991a181302d7e7243b99aa663f856424ff56885461')
install=${pkgname}.install

package() {
  cd "$srcdir"
  tar xvzf data.tar.gz
  echo ">>> Patching... (Hardcode archlinux java11 JAVA_HOME into xxx.service)"
  echo 'Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk"' >> "$srcdir/usr/lib/systemd/system/microsoft-identity-device-broker.service"
  echo 'Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk"' >> "$srcdir/usr/lib/systemd/user/${_pkgname}.service"
  cp -r "$srcdir/usr" "$srcdir/opt" "$pkgdir/"
}


