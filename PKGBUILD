# Maintainer: Lucas Mindello <lucas at mindello dot com dot br>

pkgname=homeassistant-osagent-bin
pkgver=1.8.0
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
    _checksum="8faee71395e4768ff8e8530b6c11a929a883383c44344ef8a93ec8e00a3aa412718550f580224436cb1704d8d6ebf8907bdbb962684d28c2a8f6b1fb801d74ea"
    ;;
  i686)
    _arch="386"
    _checksum="399bcaf3b8d58af85b54953afad1776a4237b81561b94e1884ac89a901bad93cef319d5043e44eee8d579ff93a3faafab732bd5dbb833da61fbc8ea347006fc8"
    ;;
  aarch64)
    _arch="arm64"
    _checksum="9486dcc6f8717e2346d14b1a6942023f5eb85a838d8cbcb4f1c4799ccbad49d4c48cbd998c8a3f6035cc18d17cc2a96542fdde0e4a8843d8f2e3e5be61912243"
    ;;
  armv7h)
    _arch="armv7"
    _checksum="fab13d471cf3a782d07c52712961a69d2bf4cbc1c6bc1d7ac008dcec926ddae7007bbde2a2a7db391efde5df30494a5f1782e9cfa854a1c39431277433b2674d"
    ;;
  armv6h)
    _arch="armv6"
    _checksum="8b6cd9a1460a86ddbb83b7725c05177cab06fd83dad265f04f8f5bc04a6d30a83b744338615c90723063df7aea9e1fd2a1f1e663da672203430960bda7573f9e"
    ;;
  armv5tel)
    _arch="armv5"
    _checksum="5764e5ac31c4cabee71026ebe9297b9bba86efd8db2da1aeefb8f749a08847d920f91c9f6839fc5446689f797e70c5e594264bd15b7781959991da80d7c96860"
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
