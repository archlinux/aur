# Maintainer: huggy <arch@huggy.moe>

pkgname=authentik-outpost-bin
pkgver=2024.6.2
pkgrel=1
pkgdesc="authentik is an open-source Identity Provider that emphasizes flexibility and versatility."
arch=('x86_64' 'aarch64')
url="https://github.com/goauthentik/authentik"
license=('MIT')


if [ "$CARCH" == "x86_64" ]; then
    _arch="amd64"
    sha512sums=(
      d34cbcbfec15946371b06041a1c0a66d6f309750658bbb032ac56bd4409b4d0b802772cf8ad8aae02bd12bdafca46d81ad43e149c238975dae7f7eec29298226
      41399266f9db38bd9d962f7f5e7b0c0a692adb551c8678a85b154d85e8b7d39f6febe684aa91a2fce6247c808d3790749059984981288a2a1268fb349c73d450
      8646e642515ae0a87809d964435ece1b4294f43544936cd71c61d6dd30e98e91ce3e1d854caef3eee8f580e042e8b63330a8f806ce74a22572aead61759733c4
      SKIP
      SKIP
      SKIP
      SKIP
    )
elif [ "$CARCH" == "aarch64" ]; then
    _arch="arm64"
    sha512sums=(
      0340697736a400e18931c6d4b6be9af58ebfa1358089f2bbb62bac05075cce4526894041aad5c5782f80b3da1845e96026bc0687e9eee6932d88bc43dc86dbca
      bbe1e3c4ddee121c9983da9c84749d9189e612392f807c5d66d18f21b07b259577acc3939a953d6e9f4f7c4f7df78d5e007fbaa9f43df7b6dcf6f8cc9da3d4fe
      1d92b8d6dbcef6daea848d08c13539d134546ea0353f9df3bd75fd66249daf3eb2f205dd6346a3b377a83469ba5bb3b3a4cae58ac76dcbd9f8e6fd713718321e
      SKIP
      SKIP
      SKIP
      SKIP
    )
else
    echo "Unsupported architecture: $CARCH"
    exit 1
fi

source=(
  https://github.com/goauthentik/authentik/releases/download/version/${pkgver}/authentik-outpost-ldap_linux_${_arch}
  https://github.com/goauthentik/authentik/releases/download/version/${pkgver}/authentik-outpost-proxy_linux_${_arch}
  https://github.com/goauthentik/authentik/releases/download/version/${pkgver}/authentik-outpost-radius_linux_${_arch}
  authentik-outpost-ldap.service
  authentik-outpost-proxy.service
  authentik-outpost-radius.service
  authentik-outpost.env
)


package() {
  install -Dm755 authentik-outpost-ldap_linux_${_arch} "${pkgdir}/usr/bin/authentik-outpost-ldap"
  install -Dm755 authentik-outpost-proxy_linux_${_arch} "${pkgdir}/usr/bin/authentik-outpost-proxy"
  install -Dm755 authentik-outpost-radius_linux_${_arch} "${pkgdir}/usr/bin/authentik-outpost-radius"

  install -Dm644 *.service -t "${pkgdir}"/usr/lib/systemd/system
  
  install -Dm644 authentik-outpost.env "${pkgdir}"/etc/authentik-outpost-ldap.env
  install -Dm644 authentik-outpost.env "${pkgdir}"/etc/authentik-outpost-proxy.env
  install -Dm644 authentik-outpost.env "${pkgdir}"/etc/authentik-outpost-radius.env
}
