# Maintainer: huggy <arch@huggy.moe>

pkgname=authentik-outpost-bin
pkgver=2024.6.1
pkgrel=1
pkgdesc="authentik is an open-source Identity Provider that emphasizes flexibility and versatility."
arch=('x86_64' 'aarch64')
url="https://github.com/goauthentik/authentik"
license=('MIT')


if [ "$CARCH" == "x86_64" ]; then
    _arch="amd64"
    sha512sums=(
      253940227425b93d809782ebc006d81a8e09603881f8fdbb7540df5bbb1af0a7aebe7f2b987bc0fba1a3304f3c9d90b2af327703ebaeac124927a6286408a3b2
      1bd5c3dba915d4d89e4163918bb69b19e72ee071433dc96899964a733e2645496fe237f87cb2b5c6d7e2ed7bd05db9a203580e0ad7779067d0b87262277b2dd0
      6e95f736bc0c4b7c123aec89f9d131fa29e42e8e7cd99cde2d88c8cd203984af6af21c5499cf4fc408f0ba1603d013f11977827670527f7238fd4b1379f9759c
      SKIP
      SKIP
      SKIP
      SKIP
    )
elif [ "$CARCH" == "aarch64" ]; then
    _arch="arm64"
    sha512sums=(
      89a25a555ba586c20d60c19df3a07a01a3ece1e5d807eadb8d55461a29b79d627e0150aeae1635f4a9abad510190c4a1aa315b527a0432e95c74a8303ce36863
      30ffecc760995dd5076a71f1f47a826f0a97106c6daee503c8e23fa89f6f2754ea8a7cb4573649508b1f2249f7c21fc6427131c7ecb8db662aff00f89422a77c
      f33ee2cfdb2080ec09555d304d65bfbd2da7d53bd9d1929f763102adc8e06da123c40ce1898e5927244a2d952472314b610e2f5d88a376ace12c6487d56264c7
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
