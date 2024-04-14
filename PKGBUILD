# Maintainer: huggy <arch@huggy.moe>

pkgname=authentik-outpost-bin
pkgver=2024.2.2
pkgrel=1
pkgdesc="authentik is an open-source Identity Provider that emphasizes flexibility and versatility."
arch=('x86_64' 'aarch64')
url="https://github.com/goauthentik/authentik"
license=('MIT')


if [ "$CARCH" == "x86_64" ]; then
    _arch="amd64"
    sha512sums=(
      dfd3c50043d7321b0b41d9fd78004d5a0011483da624f8f071758cfb819c9316a222aeae4552e6cf9287f49810c70f174271a75b2790577c2674c26a1d150587
      1025399c33cbb1867003a6d166b5c84d25989a72bc1585cac7ee050a664f3ecef34561015a2cf54e2c6fd9700bdf6cfae89d3b7e6abcbcf1512d895cb7d80f8a
      0479c643acda5ce8abe57cd143e47e5593ff5898c2ea0b2dde6e49227d3ba45bc242a1583122d47ba682790beba52fc14d8f0f7aea2249ec95afc363a596247f
      SKIP
      SKIP
      SKIP
      SKIP
    )
elif [ "$CARCH" == "aarch64" ]; then
    _arch="arm64"
    sha512sums=(
      a3990b5804f732bc3e24b3f4e7c3bad369cc47d5b7f4ce3b1bef98bd69333b4dd2b14fe83ffb1db7bb5f38fa3d6ba725ed00a6a68089479fdade3f0f7e1374c9
      967b20c8f3d6ec06428964edc518a466d14ca5bdeec8f3edf9d4452e5c51ba7c8a9b1d451ec5636896506ecd476356ee7b94cf25a011a83196f33dea6416c4e9
      7a55bd3f1c8177098da9dc1c6a62c978737b38839caa3d6d0ca86c69991753ce249937c362a11ff92559f498e001aa4f3014c36897a2ac6473d87bef8963b6ba
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
