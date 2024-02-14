# Contributor: Oscar Alfonso Diaz (OscarAkaElvis) <oscar.alfonso.diaz@gmail.com>
# Contributor: BoBeR182 <aur AT nullvoid DOT me>
# Contributor: Sotirios M. Roussis (xToNouSou) <xtonousou@gmail.com>

pkgname=airgeddon
pkgver=11.22
pkgrel=1
pkgdesc='Multi-use bash script for Linux systems to audit wireless networks'
url='https://github.com/v1s1t0r1sh3r3/airgeddon'
license=('GPL3')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
depends=(
  'aircrack-ng' 'bash>=4.2' 'coreutils'
  'gawk' 'iproute2' 'iw'
  'sed' 'xterm' 'tmux'
  'pciutils' 'procps-ng'
)
optdepends=(
  'asleap: Actively recover LEAP/PPTP passwords'
  'beef-git: The Browser Exploitation Framework'
  'bettercap: Complete, modular, portable and easily extensible MITM framework'
  'bully: Retrieve WPA/WPA2 passphrase from a WPS enabled access point'
  'ccze: Robust and modular log colorizer with many plugins'
  'crunch: A wordlist generator where you can specify a standard character set or a character set you specify and generate all possible combinations and permutations'
  'curl: An URL retrieval utility and library'
  'dhcp: A DHCP server, client, and relay agent'
  'dnsmasq: Lightweight, easy to configure DNS forwarder and DHCP server'
  'ethtool: Utility for controlling network drivers and hardware'
  'ettercap: A network sniffer/interceptor/logger for ethernet LANs'
  'hashcat: Multithreaded advanced password recovery utility'
  'hcxdumptool: Small tool to capture packets from wlan devices'
  'hcxtools: Small set of tools convert packets from captures for the use with latest hashcat or John the Ripper'
  'hostapd: IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator'
  'hostapd-wpe: Modified hostapd to facilitate AP impersonation attacks'
  'john: John the Ripper password cracker'
  'iptables: Linux kernel packet control tool'
  'lighttpd: A secure, fast, compliant and very flexible web-server'
  'mdk3: WLAN penetration tool'
  'mdk4: WLAN penetration tool'
  'nftables: This software provides an in-kernel packet classification framework'
  'openssl: The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
  'pixiewps: Offline bruteforce of the WPS pin exploiting the low or non-existing entropy of some APs'
  'reaver: Brute force attack against Wifi Protected Setup'
  'rfkill: Tool for enabling and disabling wireless devices'
  'systemd: System and service manager'
  'tcpdump: A powerful command-line packet analyzer'
  'usbutils: USB Device Utilities'
  'wget: A network utility to retrieve files from the Web'
  'wireshark-cli: Network traffic and protocol analyzer/sniffer CLI tools'
  'xorg-xdpyinfo: Display information utility for X'
  'xorg-xset: User preference utility for X'
)
makedepends=('binutils')
sha256sums=('9dd992c8b9c53f07030cc33ca743dec8d748e9f195201d906bfc475f6447e830')
arch=('any')


prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's|AIRGEDDON_AUTO_UPDATE=true|AIRGEDDON_AUTO_UPDATE=false|' .airgeddonrc
}

package() {
  cd ${pkgname}-${pkgver}

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/airgeddon"

  install -Dm644 -t "$pkgdir/usr/share/doc/airgeddon/" README.md CHANGELOG.md CONTRIBUTING.md CODE_OF_CONDUCT.md
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/airgeddon/LICENSE"

  rm -rf *.md .git* .editor* binaries imgs Dockerfile pindb_checksum.txt

  cp -a --no-preserve=ownership * "$pkgdir/usr/share/airgeddon"
  cp -a --no-preserve=ownership .airgeddonrc "$pkgdir/usr/share/airgeddon"

  cat > "$pkgdir/usr/bin/airgeddon" << EOF
#!/bin/sh
cd /usr/share/airgeddon
exec bash airgeddon.sh "\${@}"
EOF

  chmod a+x "$pkgdir/usr/bin/airgeddon"
}

# vim: ts=2 sw=2 et:
