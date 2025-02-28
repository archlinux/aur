# Maintainer: Lucas Mindello <lucas at mindello dot com dot br>

pkgname=homeassistant-osagent-bin
pkgver=1.7.0
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
    _checksum="9ffa2c09bf2e0c8c02ac270b3faacc7b0d51547262b9988206df6d89bbebafb0519713cdb7ec7a0948b9559ce412b8e0ab39dc1feb2c55da103b96302825413a"
    ;;
  i686)
    _arch="386"
    _checksum="cea3b0f34483da57eb064df8c2feb4ccd7e27bba6299b38a042d8d5ebdfc838a8c769584b4d51c72aedfc97133435d86ee0f56c571d2f5f72b2e646c59c17812"
    ;;
  aarch64)
    _arch="arm64"
    _checksum="baa77ca6837b9e33ff5b06e3a9e31766dc1db0ee2588d0e618b6ac862048ef950a09f05a72b2fad7450bd557f43da5c95b813fa02aacae4c68f349c413f03efa"
    ;;
  armv7h)
    _arch="armv7"
    _checksum="abe5c6531d55a940729c818798a49a30db8fa052844d5cf4909e41fb646456f911edf58c3eb6195eeece76e9f449a43c222b0ff87f10705872b409d9a33af87e"
    ;;
  armv6h)
    _arch="armv6"
    _checksum="d8bfd7e041eac9cc0ffeed9f23ce5f7c7194e83773eb8844675c53d3c03d3e7d67a192f5e1548f7109a591b8162ab63dfa29505d7280a9c6d3364ce1d0136876"
    ;;
  armv5tel)
    _arch="armv5"
    _checksum="56dac2b9833d35d78b5ea2940b386d0e25826e9b4c25abdd02e8804c28b04009eab454bebba18fc23e69dac23918d4943b77868471e1c6fe564b7bf3f03d9ace"
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
            "2232512c3f5150fe04f7c7fbc684ea0461bb205cfecf46de1a00aa16ec59f54e1cfcf1bda28eec100c8e9b5f9d1ec1482f0bf8e977356b2ee2fe2dc433a85632" 
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
