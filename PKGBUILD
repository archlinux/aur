# Maintainer: Lucas Mindello <lucas at mindello dot com dot br>

pkgname=homeassistant-osagent-bin
pkgver=1.7.2
pkgrel=1
pkgdesc="Home Assistant OS Agent"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'armv6h' 'armv5tel')
url="https://github.com/home-assistant/os-agent"
license=('APACHE')
depends=('udisks2')
provides=('homeassistant-osagent')
conflicts=('homeassistant-osagent')

case "$CARCH" in
  x86_64)
    _arch="amd64"
    _checksum="6a5a437d809d2ec251fa08d3edc07893e7e3233cb2278c7a389d0e068d0767ed7ea287a6b2d01f1b0d3ced67bb23c4d70bc7f3bde5c000daa1e3e6150bc26659"
    ;;
  i686)
    _arch="386"
    _checksum="a1d3a8698163ca3009d03168e8bb14927e8ec6b94eeb2769d76ee4d8ecca9567076eea3e5a4ed771de8d2b8bef1a28445cb1f47b78d17e355a42abd5be3a50bf"
    ;;
  aarch64)
    _arch="arm64"
    _checksum="0b344f5390985b3e3d973145f9c0bdf66039e9d2912a5b3f8b3ecb7b870f1f9420c8e8a74a26cfb779ab688cc196b1a6b01652bec8c4add8c42b73c19bd054b4"
    ;;
  armv7h)
    _arch="armv7"
    _checksum="a351eb0041e835010fc170478ded6b6b90373011fd4d2a7f5cb57a25dcccfa0540961e6e8f78cc158d69e6fa6ca4ddc34a42147894496f644a4907ebbe7f29b3"
    ;;
  armv6h)
    _arch="armv6"
    _checksum="167933781068c079e046f5a71fff1052d927be3210ceb2025dd10fee7a22454e5d9cecd59ec1fae0ee658f0e8f1c0fb7eec2cf3f8baa981a174f49ecde0961fb"
    ;;
  armv5tel)
    _arch="armv5"
    _checksum="43a2d013609d2b32d3b04c7e35fadc881069bff1430a328c855454e1faee8384f831b2a48168cd8a0cd8e0929064077c09ed5dc6b6aa9e7257fba6612ed38c02"
    ;;
  *)
    echo "Arquitetura não suportada: $CARCH"
    exit 1
    ;;
esac

source=("https://github.com/home-assistant/os-agent/releases/download/${pkgver}/os-agent_${pkgver}_linux_${_arch}.tar.gz"
        "haos-agent.service"
        "io.hass.conf")
sha512sums=("${_checksum}" 
            "5642b88671de8bde85c6888cb9febc8b3a88b443a42f881db7eb5255b91d2a6eb55030f53b41cdc83591cf9b00c5e2823d76fc5841938a87e9106729fed73ed0" 
            "bf965cf393b03a162d44eefac795c965b816da49faf2d49c6cb207044b871dccbbf2158ea77b44d38a36c55ffa0916c414577904a902d1e34cc17173420a4f68")

build() {
  cd "$srcdir"
  tar -xzf "os-agent_${pkgver}_linux_${_arch}.tar.gz"
}

package() {
  install -Dm755 "$srcdir/os-agent" "$pkgdir/usr/bin/os-agent"
  install -Dm644 "$srcdir/haos-agent.service" "$pkgdir/usr/lib/systemd/system/haos-agent.service"
  install -Dm644 "$srcdir/io.hass.conf" "$pkgdir/etc/dbus-1/system.d/io.hass.conf"
}
