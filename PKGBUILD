# Maintainer: huggy <arch@huggy.moe>

pkgname=authentik-outpost-bin
pkgver=2024.8.0
pkgrel=1
pkgdesc="authentik is an open-source Identity Provider that emphasizes flexibility and versatility."
arch=('x86_64' 'aarch64')
url="https://github.com/goauthentik/authentik"
license=('MIT')


if [ "$CARCH" == "x86_64" ]; then
    _arch="amd64"
    sha512sums=(
      1ccf9dea91c55866fce79f92eb0df2c2cd6faec23ce42ca6ce64b3a08a10fa31ad7332b15d4c044bcca43a3967d191b24258e6a0a8751f761f2c9fd379dbcd81
      48487a486f60286f9a930096199ce3e2fda549e6884ec4338f51cea8cac6d179abaae50f4fffac863b24f3d861b22f58817be8e0181a5c25e173414365b65e69
      df059078b01dfdea2408cd381b288fc1c596bdbd048679b268f20590350f9fcec580ed83387e859040ce46456fd005b1f558c0093575c24182fb17a3eba8337a
      SKIP
      SKIP
      SKIP
      SKIP
    )
elif [ "$CARCH" == "aarch64" ]; then
    _arch="arm64"
    sha512sums=(
      208c704a0d9aa780ba74b105c3ce16a32b6bb14d111b6b5dc35426708f9da444d19559ca99e1e0970e10f0bbd0c07903612f352f1a1ec4a2877f922ce486a471
      6177e58a550de4c73f436bf077b781688d5d25bea6eebdd446fc0de73863dbb33a142923b78ad565bcf11b09866227bcb0e718d0ddf871b7fa54d1bc752f2953
      e10e34584bb1843fda0d7d58a84bff5c12713c9bab6d87f446558129bc754c0f374e0a9c4ca5dbf80e072642ea1b87e3acc5bb0e31bb47aa1cffad9b18597a4c
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
