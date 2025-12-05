# Maintainer: Lucas Mindello <lucas at mindello dot com dot br>

pkgname=homeassistant-osagent-bin
pkgver=1.8.1
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
    _checksum="c76e71696381503884bcc7402927aeb5104f36c77234284b14bbbc8482c546bfe25e9f8e8f305a4ba9312e74e3f6a0cbcc28e5f45d130069d31b4c3a11ba199a"
    ;;
  i686)
    _arch="386"
    _checksum="8706855ae7d38e6ac038975f9d4afc828a5d7544a5f27b15c6d6cd988a218775f9e3d05eecf18c5c10baaef823339aa2af0473c7f537addfc0ec4b82eb4022be"
    ;;
  aarch64)
    _arch="arm64"
    _checksum="d956e646acd37775f701c89fd9943b31aba29e26f9c7c40651d170679de034c25c802f911f6358ab6e15293f947efc32d305ba3f6ec210d2ee2c66f7d31bb2ef"
    ;;
  armv7h)
    _arch="armv7"
    _checksum="b315ab980366893142398d9adc1b417c654f5a5ecae2e1626ce5be9770043bd14bd8774d81b7be2c1afc29d4537f7786b2a475fdadc961949a6289763438d45e"
    ;;
  armv6h)
    _arch="armv6"
    _checksum="44c22249d1c1da4b5196575db85d016aa41d9e5219533c9c58703e88a291b6407b436862a5c7ecb514af075dca2aa3795794be2ef13df89891849c2c49107f8d"
    ;;
  armv5tel)
    _arch="armv5"
    _checksum="6e600163d61755c7492a5d38e918ec674b69889cfebdfeb715fc54bea21de384d3617d8bebef9968d32171411e8712f3d66a159162d7c400cb9fd9b594cb6044"
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
